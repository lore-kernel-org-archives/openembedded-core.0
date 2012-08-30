Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1T7ESL-0006qJ-UP
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 01:47:26 +0200
Received: by pbcwy7 with SMTP id wy7so4049526pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 16:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=fYWPpwmZbn0QxihcCVoI6DaaeoDGK+4Bm/pSpoYqmPQ=;
	b=K/JSdZ0gP4ZqW9FyMbQ7aQ1PW+ayVC7bcoailzNp7HIN4D61puTxZbWiFThkCQvcVA
	e3iLB/FRDVzd09B/cXvCA8o2Anu+avmkaPols8YFh1ktVl+QUwitzDMH7qwX/O+Wp1gn
	MCEknEnuUceMJuW4LoTDCLAQLsLPbNacyxCws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=fYWPpwmZbn0QxihcCVoI6DaaeoDGK+4Bm/pSpoYqmPQ=;
	b=Ry4m2hf4Bd7R1YcdB+btIQpuGOVWqSrQOUJ1cSc0HRPh+cEiyfWGyVRbTcR2RFoJKH
	mf+/60dSgzy/aFkce6w6oqP5AwRlCvnFDAPL/vsM8IPUMQoiuxcu7lWwM3qLn5uEwj93
	j4/yk/q13lTpGSItU6QgNLa2Op7T7/7WJDlpH+8rdB08auvyMZtTqXJGeryVTCElg55z
	+wQfRonByCxAtalAwn6h8gArn45PRMNCBlq0kslE2lxd1EB+qElNSs/lhw5xhcAA2QmE
	F9u8Pm3NrMHTadNyMDevj0MZqCx++t9t5k+oyCD3TNet2M8m2DBoAOGMtZyZamTJ9Nc7
	1pvg==
Received: by 10.68.217.100 with SMTP id ox4mr13984011pbc.87.1346369709142;
	Thu, 30 Aug 2012 16:35:09 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ox5sm2342724pbc.75.2012.08.30.16.35.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 16:35:07 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2012 16:34:22 -0700
Message-Id: <1346369662-17265-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlk6XByF+2uA9MjceaxaRLB924gQghJdk6Eov9aLUgHTOToxRNhEjv7B4SE/7PvnOeIqj+e
Subject: [PATCH] connman: Ignore eth0 cleanup when booting over the network
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
X-List-Received-Date: Thu, 30 Aug 2012 23:47:26 -0000

There was a change to connman, such that it cleans up the
route table for devices at startup, this was causing the
network to get lost and NFS to loose it connection.

The -I option will cause the device to be ignored.

[YOCTO #3008]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman/connman |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index f01bf37..2c8354a 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -29,7 +29,7 @@ done
 do_start() {
 	EXTRA_PARAM=""
 	if test $nfsroot -eq 1 ; then
-		EXTRA_PARAM="-P ethernet"
+		EXTRA_PARAM="-P ethernet -I eth0"
 	fi
 	$DAEMON $EXTRA_PARAM
 }
-- 
1.7.9.5



