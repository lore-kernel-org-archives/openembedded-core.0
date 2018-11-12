Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
	[209.85.219.171])
	by mail.openembedded.org (Postfix) with ESMTP id D4AF66C2B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 12:57:04 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id w17-v6so3843239ybl.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 04:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ga9XUnKa4nblb8gK/fbWbEncRnhcKBLdzBalPt0g8+U=;
	b=KS26I57tBZnHKUap0a0CQ8lTn4hh4IA2w8kOqeob4M7IoKYHJlPIiV549Rn5/YOslk
	JUWXhkRlKIdGFMcnCszK35L2nnLka9nySnW1jJwi8a1cYPf/XDswPnmC3ve1FwarKOIc
	jgIJl10yZgBt4wYFQBdfQfTur0GW/O/Vq3cHnOlX7xvTAFlRIPfuyiBAyI190dx3pcXy
	2De/K9awHo8ZHWFdtsDvFKvOkIQ7+G7zoo0t/LcbJxvyuwSDU/pFzB9zB9+xjSRTbSYU
	U6iJOHXWL+lLn5ANL95UZsr4JQoom2p6YehU/qvGpBj60BhdOp4/5Z030upKE2D2aOSj
	jzZg==
X-Gm-Message-State: AGRZ1gLZRN9YCsIEyowINhhlA3g8EWQaiDC8ZR/7kJxjkhUu+9UCASVT
	LL2IWCSwHV2nm4ulw7NOIpEEFTpy
X-Google-Smtp-Source: AJdET5eJTKI4yQnnRjVL5buvyo0nEuBPgy3I8+A6gdOwJR3lO9G/evac1wGuKs/aYo7V766HiVWEsA==
X-Received: by 2002:a25:be85:: with SMTP id i5-v6mr665074ybk.60.1542027425841; 
	Mon, 12 Nov 2018 04:57:05 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s189-v6sm445273ywg.69.2018.11.12.04.57.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Nov 2018 04:57:05 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Nov 2018 12:56:53 +0000
Message-Id: <20181112125653.21157-2-git@andred.net>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181112125653.21157-1-git@andred.net>
References: <09487c1d7e9d9a2cf0c60883ad209712c2d31dc2.camel@andred.net>
	<20181112125653.21157-1-git@andred.net>
MIME-Version: 1.0
Subject: [DONT-MERGE] sstate: add hack to detect sstate archive compression failures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2018 12:57:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/sstate.bbclass | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index efb0096c70..b0ba07cacb 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -731,6 +731,8 @@ sstate_create_package () {
 
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
+	    ctr=0
+	    while [ $ctr -lt 2 ] ; do
 		set +e
 		tar $OPT -f $TFILE *
 		ret=$?
@@ -738,6 +740,33 @@ sstate_create_package () {
 			exit 1
 		fi
 		set -e
+
+		TDIR=`mktemp -d ${SSTATE_PKG}.extracted.XXXXXXXX`
+		tar -C $TDIR -xzf $TFILE
+		export TFILE
+		find $TDIR -type f -exec sh -ceu '
+			for c in "$@" ; do
+				if stat "$c" | grep -v "Size: 0" | grep -q "Blocks: 0" ; then
+					echo File $c in archive $TFILE is broken
+					echo "$TFILE -> $c" >> "$TFILE.broken"
+				fi
+			done
+		' _ '{}' +
+		rm -rf $TDIR
+		if [ ! -s "$TFILE.broken" ] ; then
+			if [ $ctr -ne 0 ] ; then
+				bbwarn "$TFILE created successfully on attempt # $ctr"
+			fi
+			break
+		fi
+		bbwarn "$TFILE is broken, retrying"
+		bbwarn "`cat $TFILE.broken`"
+		rm $TFILE.broken
+		ctr=$(expr $ctr + 1)
+	    done
+	    if [ $ctr -ge 2 ] ; then
+		bbfatal "Could not compress sstate"
+	    fi
 	else
 		tar $OPT --file=$TFILE --files-from=/dev/null
 	fi
-- 
2.19.1


