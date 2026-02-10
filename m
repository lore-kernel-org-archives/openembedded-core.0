Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA00EA3F16
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 07:10:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15028.1770707445362211496
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 23:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ay0IH75F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6501c5c083=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6dUMc1796014
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Feb 2026 23:10:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ypJ90v9yeRPvUkxxRpK6rHLB1h1FJEK8l4mpXWDFfN0=; b=ay0IH75FlZTr
	aGpVMkOG2AyNNpsDk4gOyTGN7M2WYn9mKwWq4RgZp6fejVBRvb4PA5g9wmV0Pp/x
	aYDmb1bNd0oZeFZPgu0Pfpn2VxMtR24l0wXnsJOW9oQVyU1UQFC3M0LXOodSSW9O
	fNBhbRs74+yMAxF/rZyeG9vYMKcefNwDTM+YeFVFkj8D5HKT998VLa5xmXstuDQC
	fWGtCo2q0XQcrDeQY2UO4b+rez1ywmlgGkp9pa2EWDJAvTC8kCT9wURp2Nk2fq3T
	xPVrCMEyuBj66h7tEaXizbnSCpziNBf5B6zB3ucMbbUfzGBdmOO4vNPS5Plbs+ea
	xrzTyLk3Zg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj2m0n-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 23:10:44 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 9 Feb 2026 23:10:43 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 9 Feb 2026 23:10:43 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 3/7] classes-global/package_rpm.bbclass: Remove %pre and %postin for libc6
Date: Mon, 9 Feb 2026 23:10:38 -0800
Message-ID: <59ba081c8c874065b6cdc050a2897422be4a7a59.1770707181.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1770707181.git.liezhi.yang@windriver.com>
References: <cover.1770707181.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JTFf5j89VLtZBdZnwJJZBQmfceaSLiTq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA1OSBTYWx0ZWRfX+kIPJOWCOjy+
 PQWDxDjfVMYUu30mU8Rejfjet2tyPdOo3nxXJvEzw9Etrz9bJnp+ZBy5g4cKSRKRrkceKS0g7nP
 dlgwYClwoGDQ20W8pPzHgBLSUy9FKVprOksV8TGRnDKStZNkGe4tJ3/PJcvAHolznBhxf6zd1SN
 nf1N+p1ll/sCAcZHOrwh3yM0fv82KyVWdRajmkCdPjDq4aeiXuOmOrQq6zdV/cNMvMRhB91+0ew
 b9viSHyfP2aRslx4flWqDU82PRLGEw3MxMcbFhYa41FNGvWArYKId4xQjcZ3E6LQ9E/lJjrWATy
 heB0tOxSUSkqYxI87YK9sYkiPprcaSy6DQbth1K0mu6n7XrgREF8VxptH6CIOcLQMWXdbPeg/Br
 qqbyBE1kw8t3t8v48742JUnNFCdhF61HRRczOUxuR6zPMU43WWbwDBrQ4lVWOSK22GMYNwpSo9s
 IUobJ9AsNZ6+ArSa/Yg==
X-Proofpoint-GUID: JTFf5j89VLtZBdZnwJJZBQmfceaSLiTq
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698ad9f4 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=mMdV-Zv2kfK-Y5NqG1sA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230855

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
$ bitbake core-image-full-cmdline:do_testimage
%post(busybox-1.37.0-r0.x86_64_x32): execv(/bin/sh) pid 624
error: failed to exec scriptlet interpreter /bin/sh: No such file or directory

It is because busybox and libc6 depends on each other, busybox' elf files
depends on libc6, and libc6's postin depends on busybox' /bin/sh, the do_rootfs
works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=1, but it
would be failed for a fresh rootfs.

In rpm 4.20.1, it let the installed files' Requires win, so it installed
busybox firstly, but in rpm 6.0.1, it let the postin's Requires win since
postin would run immediately after the files are installed, this does make
sense, so it installed busybox (which provides /bin/sh required by libc6'
postin) firstly, then we got the errors. I couldn't find which commit made this
change because a lot of files and functions are refactored during 4.20.1 and
6.0.0 (not .1), I also tried bisect, but failed because a lot of do_patch or
do_configure/do_compile failures for each build.

For libc6's the postin is:

  #!/bin/sh
  if [ x"$D" = "x" ]; then
      if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
  fi

This doesn't make sense for lib6 since there is no /bin/sh or ldconfig when
libc6 is not ready yet, so we can just remove libc6's postin to fix the
problem.

And also remove the workarounds in oeqa/runtime/cases/dnf.py, they are not
needed any more since the circular dependency is fixed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 6 ++++--
 meta/lib/oeqa/runtime/cases/dnf.py      | 8 --------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f4dd779a52..526ac57982 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -421,12 +421,14 @@ python write_specfile () {
         spec_preamble_bottom.append('')
 
         # Now process scriptlets
-        if splitrpreinst:
+        # The libc6 shouldn't have %pre or %post to avoid circular dependency
+        libc6 = '%slibc6' % (d.getVar('MLPREFIX') or '')
+        if splitrpreinst and splitname != libc6:
             spec_scriptlets_bottom.append('%%pre -n %s' % splitname)
             spec_scriptlets_bottom.append('# %s - preinst' % splitname)
             spec_scriptlets_bottom.append(splitrpreinst)
             spec_scriptlets_bottom.append('')
-        if splitrpostinst:
+        if splitrpostinst and splitname != libc6:
             spec_scriptlets_bottom.append('%%post -n %s' % splitname)
             spec_scriptlets_bottom.append('# %s - postinst' % splitname)
             spec_scriptlets_bottom.append(splitrpostinst)
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 3ccb18ce83..029651c571 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -124,15 +124,8 @@ class DnfRepoTest(DnfTest):
         self.target.run('mkdir -p %s/bin %s/sbin %s/usr/bin %s/usr/sbin' % (rootpath, rootpath, rootpath, rootpath), 1500)
         self.target.run('mkdir -p %s/dev' % rootpath, 1500)
         #Handle different architectures lib dirs
-        self.target.run('mkdir -p %s/lib' % rootpath, 1500)
-        self.target.run('mkdir -p %s/libx32' % rootpath, 1500)
-        self.target.run('mkdir -p %s/lib64' % rootpath, 1500)
-        self.target.run('cp /lib/libtinfo.so.5 %s/lib' % rootpath, 1500)
-        self.target.run('cp /libx32/libtinfo.so.5 %s/libx32' % rootpath, 1500)
-        self.target.run('cp /lib64/libtinfo.so.5 %s/lib64' % rootpath, 1500)
         self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
         self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
-        self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
         self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
         self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox' % rootpath)
         status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath, 1500)
@@ -156,7 +149,6 @@ class DnfRepoTest(DnfTest):
         self.target.run("for l in /lib*; do mkdir -p %s/usr/$l; ln -s usr/$l %s/$l; done" % (rootpath, rootpath))
         self.target.run('cp -r /etc/rpm %s/etc' % rootpath)
         self.target.run('cp -r /etc/dnf %s/etc' % rootpath)
-        self.target.run('cp /bin/busybox %s/bin/sh' % rootpath)
         self.target.run('mount -o bind /dev %s/dev/' % rootpath)
         self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox' % rootpath)
         status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath)
-- 
2.49.1


