Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8FB72E66
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:30 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so5966515pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=I7elolMB0Gwm5iOJbv23BiGpnxIc632MGMz9S7qWKKM=;
	b=wCKPxNyH+YgMwJJBgg3zo3AUzSqnJVy021yfRHc8AKJbS8kDwlnkxaCWhIKxyruX25
	NuH8k8i+V7kucdnTGpC+6GjtvqaohO8t1OGJkHe/OAQwsEH1Y/snfAnu98qwizGgmgCf
	rUqwYikrU8AO2TSSxujPXG5hQiW/HJbdVse8725tLeKoFzhhqSut4Lky3JuvtIQoJEdl
	j1qPI+tZAK1Ouks9JhdU8PXHw3hkwc02f4+XEan6JznLzqYfgEoaGVs9sZm+wgn4TLbr
	diOiTz+YPr7QoOu0Aca2a2owYGxvUPIjPoU5W2KNmAVu98KAYvHJ5VmrpJzxTI6xxSoZ
	uK5A==
X-Received: by 10.70.126.68 with SMTP id mw4mr5676022pdb.106.1423152332446;
	Thu, 05 Feb 2015 08:05:32 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:47 -0800
Message-Id: <da0927c13ab443ce55191abeacf4c854d814afab.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 39/61] distcc: fix initscript can not stop distcc daemon correctly
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:31 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

The distcc's initscript has used option '--pid-file' to save daemon
process id, but it didn't to create that file, that caused start/stop
distcc daemon failed.

We refer what Ubuntu 14.04 did, create pid file before start and
delete it after stop

[YOCTO #7090]

(From OE-Core rev: 3b0d6c7c324f0283cfab10445d1a5a3bf2526598)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/distcc/files/distcc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/distcc/files/distcc b/meta/recipes-devtools/distcc/files/distcc
index c7c414d..e36f0fa 100755
--- a/meta/recipes-devtools/distcc/files/distcc
+++ b/meta/recipes-devtools/distcc/files/distcc
@@ -51,6 +51,9 @@ should_start() {
 		echo "$DAEMON not starting"
 		exit 0
 	fi
+	# we need permission to write to the pid file
+	touch /var/run/$NAME.pid
+	chown distcc /var/run/$NAME.pid
 }
 
 case "$1" in
@@ -75,6 +78,7 @@ case "$1" in
 	    echo "$0: stop failed with error code $code" >&2
 	    exit $code
 	}
+	rm -f /var/run/$NAME.pid >/dev/null 2>&1
 	echo "."
 	;;
   restart|force-reload)
@@ -92,6 +96,7 @@ case "$1" in
 		--exec $DAEMON -- $DAEMON_ARGS $ALLOW ||
 	{
 	    code=$?
+	    rm -f /var/run/$NAME.pid >/dev/null 2>&1
 	    echo "$0: restart failed with error code $code" >&2
 	    exit $code
 	}
-- 
1.9.1


