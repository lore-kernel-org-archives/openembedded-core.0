Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1TtUnI-0002yc-45
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 03:56:35 +0100
Received: by mail-oa0-f44.google.com with SMTP id n5so1358252oag.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 18:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:x-forwarded-message-id:content-type
	:x-gm-message-state;
	bh=kfFfZ5Pp4UCjEjaEvtEB0FNFXHsb968hwXPQpXUmo1I=;
	b=bl8K1ggs0AB0icMBZycMP0BszRmtp2HRNYnZrqA9RVAf4RgOLQVjArcQDNgc6iASCE
	nr3SXNYh6cfEjLKHYL73p6AKuySdot+Ngpx6qBrrEvh1P4SDRefgL4qnJrbgxzcDlLde
	LL5tGvJeoxLr3qi6pDXmxiCvv6uUKMbCg5hkzC8qW1At6GCZzNJOlmbUswBAMztDaC1n
	s35c9RK8NuTWyBhtD+5JpFmOobX+8tpn0duCp1uUCJ4BpqkXVtjQun3Fw7WuGH1sm53+
	0oefKCjH2hKRT1UxF791F01GmJCt1msTlgc7u38/AdThOmVURv7x69BzmCWR7lisq860
	DR2g==
X-Received: by 10.60.7.167 with SMTP id k7mr44825523oea.20.1357872077460;
	Thu, 10 Jan 2013 18:41:17 -0800 (PST)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id vk8sm2625793obb.19.2013.01.10.18.41.15
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 18:41:16 -0800 (PST)
Message-ID: <50EF7BFF.70908@felipetonello.com>
Date: Thu, 10 Jan 2013 18:42:07 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1357866646-31522-1-git-send-email-ftonello@cercacor.com>
In-Reply-To: <1357866646-31522-1-git-send-email-ftonello@cercacor.com>
X-Forwarded-Message-Id: <1357866646-31522-1-git-send-email-ftonello@cercacor.com>
X-Gm-Message-State: ALoCoQnMDuAheW6A5M/cjgJ915dgQq91Q/1hIGnbgfLXTI7oDmpE6XwqKTswXd+8L23xywkNNg6D
Subject: [PATCH] connman: fixed init script so connman can runs over nfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 02:56:36 -0000
X-Groupsio-MsgNum: 33690
Content-Type: multipart/mixed; boundary="------------090700040506020409080701"

--------------090700040506020409080701
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

From: "Felipe F. Tonello" <ftonello@cercacor.com>

Adding -I to the arguments, connmand will ignore the eth interface, so 
if you
are using nfs it will not be disconnected.

OBS: it might not work if using more than one eth interface. But it's better
than not using connman with nfs at all.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
  meta/recipes-connectivity/connman/connman/connman |    6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/connman 
b/meta/recipes-connectivity/connman/connman/connman
index 4a0017f..aed4a79 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -28,9 +28,11 @@ done

  do_start() {
  	EXTRA_PARAM=""
-	if test $nfsroot -eq 0 ; then
-		$DAEMON $EXTRA_PARAM
+	if test $nfsroot -eq 1 ; then
+		ethn=`ifconfig | grep eth | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
+		EXTRA_PARAM="-I $ethn"
  	fi
+	$DAEMON $EXTRA_PARAM
  }

  do_stop() {
-- 
1.7.9.5




--------------090700040506020409080701
Content-Type: text/plain; charset=UTF-8;
 name="Attached Message Part"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Attached Message Part"



--------------090700040506020409080701--
