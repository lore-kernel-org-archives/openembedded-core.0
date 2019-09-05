Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 77B997ECB5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 23:07:09 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h7so4551124wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 16:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rkNSsIdxWFSjpWEQ5yKHQ2KXcQ88kAoeNG/ySsk+VOc=;
	b=q6splWc2RtuejCn3N6mWhuKrJE41d6ROtJn5SGutBQRD5BskX50BvYhy6dJwMrk5AA
	ZlZH02UDc4iwJV8XIdswkIp1QhKwHDNGxlAhq6mvmOS7UMlpu3vvexJ4e2e5syY00Nsx
	Cb7+/3TxoU+21N5d5TkXn7tHQpI1HKp7b+JuRTemj2QKDa0iKAAwz2gkZi6f6CD1/arK
	CTnb/zalfsYNb/ALq4Ey0CpxUJ15cuhsdCYenChoQMCxgTc1y9RP6SUm5XZS6lGRfmq3
	X5vyRZAUINa9Q1ahr3sKidOe++K51uTpxsVU5Ylr90hK2Jg+hNsP8BHUUsuWdk1/t33s
	8wUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rkNSsIdxWFSjpWEQ5yKHQ2KXcQ88kAoeNG/ySsk+VOc=;
	b=jlaRJ2ZwmSsnP0ApldJHRXYMg4VHHxjH5JRRswVUdLNiJEK57jxG2/g836vuaBzffj
	tDLiASWCJHH0o/tM2rQ0Fu5a3h7juuEEIg0peemACSOMUUK1Y2Hn/AXBK7ldJiVMxEBR
	0RDDRagh2D4FRfOJl2ebhJ05kpLxsoSv0JD33Zcqhds401aBR3592GGWhmwuCH0WJpjm
	5CCZ4c7cvMOOx32E8L0b7pW1kFpNHxe6MK02VhLowl2iVSjvattaGIwgNQngiO3jL2I2
	x8Mh8AVtXbLvVjF1J5dZEKzZ2GCP7Mu9nCgloixNnalFAMobeEFp4H3GtAY45FHvyy1Y
	YSzg==
X-Gm-Message-State: APjAAAXGt9y0IS3WdLGE/mG03KslA6/KDxJpk5zIb5xb5A/wYM+cbHMy
	6RU+9kNKVcJGTuki28foXEZnN3LnX+c=
X-Google-Smtp-Source: APXvYqyOEyuGclhlVE1iTMl0GX+kK3pTnpe6Ej/nRIMAIHAC1nANJzSPTTPVBCsiJnqP9yCHLVDbqg==
X-Received: by 2002:a5d:5402:: with SMTP id g2mr4889941wrv.291.1567724829881; 
	Thu, 05 Sep 2019 16:07:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id x6sm5455818wmf.35.2019.09.05.16.07.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 16:07:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 00:07:06 +0100
Message-Id: <20190905230706.31765-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] systemd: ensure reproducible builds by clearly exposing the time epoch support
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
X-List-Received-Date: Thu, 05 Sep 2019 23:07:09 -0000
Content-Transfer-Encoding: 8bit

systemd has the ability to check the time on boot and if it's earlier than an
epoch determined at build time, set the time to that epoch.  This is useful for
systems where the system time is January 1st 1970 (because the unix timestamp
was 0 at boot) as then at least the time is reset to something approximating the
right year at least.

By default systemd uses the mtime of the NEWS file, which is static for tarballs
and corresponds to the time the release was made, but for git checkouts this is
simply the time do_unpack() was executed.  Thus, rebuilding systemd will cause
this embedded timestamp to change.

Remove the PACKAGECONFIG time-epoch which has the logic reversed: enabling
time-epoch will set the epoch to the unix timestamp 0).  Replace with
set-time-epoch with the following semantics:

- When disabled, the time epoch is set to 0 (1st January 1970), so there is no
  time manipulation on boot.

- When enabled, if reproducible builds are configured by setting
  SOURCE_DATE_EPOCH then that timestamp is used for the time epoch.  If
  reproducible builds are not configured then the timestamp of NEWS (thus the
  build time) is used.

The set-time-epoch flag is enabled by default.

[ YOCTO #13473 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_242.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 6bbe388b1f9..2c101cbbb4a 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -83,6 +83,7 @@ PACKAGECONFIG ??= " \
     quotacheck \
     randomseed \
     resolved \
+    set-time-epoch \
     smack \
     sysusers \
     timedated \
@@ -166,7 +167,12 @@ PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,initscripts-sushell"
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
-PACKAGECONFIG[time-epoch] = "-Dtime-epoch=0,,"
+# When enabled use reproducble build timestamp if set as time epoch,
+# or build time if not. When disabled, time epoch is unset.
+def build_epoch(d):
+    epoch = d.getVar('SOURCE_DATE_EPOCH') or "-1"
+    return '-Dtime-epoch=%d' % int(epoch)
+PACKAGECONFIG[set-time-epoch] = "${@build_epoch(d)},-Dtime-epoch=0"
 PACKAGECONFIG[timedated] = "-Dtimedated=true,-Dtimedated=false"
 PACKAGECONFIG[timesyncd] = "-Dtimesyncd=true,-Dtimesyncd=false"
 PACKAGECONFIG[usrmerge] = "-Dsplit-usr=false,-Dsplit-usr=true"
-- 
2.20.1


