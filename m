Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D0ACCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 04:56:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11140.1760936212780074333
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 21:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hptWZf8I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2388656bc0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59K4c0MA617947
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 21:56:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=WgyuILUJuD9BcvedIPe3
	0Aj0XGE8ERVIooh96ZM+g5g=; b=hptWZf8I2ZVvjoKFL/RXxfJoG3Kx3QJITFCx
	Utjx4dyLAr4+jmCseJiNkNC8DYrGRHY1DJ+rVmIYyEKtMV5nDzKG7A9lEC1L+/sE
	SqJZQf1I4MzKlb3rWEU1x4YANTVJSzOaH96w8RttfVSpkoWNKxT8N8FFbglMyQPj
	mk9KmI25G2d8Rk2nuXD0LrC1cRGwt3W96G9kmoEKXvuka29zpamzcQIhlDHNVR4F
	IwO6stIhGy8HbfXoysjkI1Hvtyt+PN7NznZmWNoCHiEiyfOJun98mryHdDRJ/Xfs
	KMGxAIry73zoW118ogH3ZfOjeoF5T3hqvspYpomNDDqDEItmpw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v66099nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 21:56:52 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Sun, 19 Oct 2025 21:56:51 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Sun, 19 Oct 2025 21:56:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd: serial-getty@.service: allow device to fast fail if it does not exist
Date: Mon, 20 Oct 2025 12:56:50 +0800
Message-ID: <20251020045650.3251326-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=VN3QXtPX c=1 sm=1 tr=0 ts=68f5c114 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=9qa3YWOjAAAA:8 a=t7CeM3EgAAAA:8 a=Maj1vn_tnN759Tqo0MYA:9 a=8umJgfTHrSwA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=2Su-2_OBkbdmYqucsK2F:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: JqH1I_Om3iNlRSfTZuwG7xDMjRT2iheb
X-Proofpoint-GUID: JqH1I_Om3iNlRSfTZuwG7xDMjRT2iheb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDAzNyBTYWx0ZWRfX0fUEYZo9HBOU
 CJPFrzvD3nLaGa+RN1ebDihhkqxF6rM/l5uMIk80xDocvWVAUuPSsQTahA1+zcZG2ezXDFKC8zw
 efs4S5m4pdO0VXJK0IZXufS+1dvymuktXTs2dSyF+ELymt/qyTFPFqR4Fvxnw7Z7A3LzDHlbyjM
 bQRN8//OcTm2voJr/YEtwwMoE4qHSZ5yCTzbPN+SC03NZSGlDGagyT1H4k0OApeOOX2ls5DlUQ6
 4lGiTWbaIUn4jKoGl3gwSvazTx1X3OfHoOYUbDKtvARm9cRBPkkY0x9bUQdcvPJ6Paw9l1cjoGY
 IVe5veIRohA6tk4wmsXOUw9HqWeObJZcxI97AYGtjzch+6DEfldtiMIAhYw4ebkYbuQHbwgJxrG
 uat2UB8918R+VsvzXRXP3rQL7tLuIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510200037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 04:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225094

Due to serial-getty@.service is deleted and use existing unit
files in systemd [1], port a patch from systemd-serialgetty [2]
and apply it to systemd to allow device to fast fail if it does
not exist

[1] https://git.openembedded.org/openembedded-core/commit/?id=b6a7617145c3acf9f79888e7555e7706cd55a350
[2] https://git.openembedded.org/openembedded-core/commit/?id=f0f359ec9210759f6b4dbfb35d3fba8af208c43a

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...rvice-Allow-device-to-fast-fail-if-i.patch | 108 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_257.8.bb    |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-serial-getty-.service-Allow-device-to-fast-fail-if-i.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-serial-getty-.service-Allow-device-to-fast-fail-if-i.patch b/meta/recipes-core/systemd/systemd/0001-serial-getty-.service-Allow-device-to-fast-fail-if-i.patch
new file mode 100644
index 0000000000..f79cf79127
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-serial-getty-.service-Allow-device-to-fast-fail-if-i.patch
@@ -0,0 +1,108 @@
+From 682bdd0126ca039d8df35e8a87485eef522f39fa Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 19 Oct 2025 20:10:42 -0700
+Subject: [PATCH] serial-getty@.service: Allow device to fast fail if it does
+ not exist
+
+Some BSPs use a USB serial port which may or may not actually be
+plugged all the time.  It is quite useful to have a USB serial port
+have a getty running but it does not make sense to wait for it for 90
+seconds before completing the system startup if it might never get
+plugged in.  The typical example is that a USB serial device might
+only need to be plugged in when debugging, upgrading, or initially
+configuring a device.
+
+This change is somewhat subtle.  Systemd uses the "BindsTo" directive
+to ensure existence of the device in order to start the service as
+well as to terminate the service if the device goes away.  The "After"
+directive makes that same relationship stronger.  When used together
+this has the undesired side effect that systemd will wait until its
+internal time out value of 90 seconds for the device to come on line
+before executing a fail operation or letting other tasks and groups
+continue.  This is certainly the kind of behavior we want for a disk,
+but not for serial ports in general.
+
+The "BindsTo" directive is replaced by the combination of the "PartOf"
+and the "ConditionPathExists" directives.  The "After" directive is
+unchanged because that will wait for the udev rules to process.  The
+"PartOf" directive will issue a stop to the getty service if the
+device goes away, similar to the "BindsTo" directive.  The
+"ConditionPathExists" is what allows the service to fail fast vs
+waiting for the timeout.  When a USB device is not plugged in at boot
+you would find a message in the system journal like:
+
+    systemd[1]: Condition check resulted in Serial Getty on \
+                 ttyUSB0 being skipped.
+
+In Yocto project, if you want to observe the problem with qemu, it is
+easy to replicate. Simply add the following line to your local.conf for
+a x86-64 qemu build.
+
+    SERIAL_CONSOLES="115200;ttyS0 115200;ttyUSB0"
+
+Login right after the system boots and observe:
+
+   root@qemux86-64:~# systemd-analyze
+   Bootup is not yet finished (org.freedesktop.systemd1.Manager.FinishTimestampMonotonic=0).
+   Please try again later.
+   Hint: Use 'systemctl list-jobs' to see active jobs
+
+   root@qemux86-64:~# systemctl list-jobs
+   JOB UNIT                         TYPE  STATE
+   96  serial-getty@ttyUSB0.service start waiting
+   97  dev-ttyUSB0.device           start running
+   1   multi-user.target            start waiting
+   88  getty.target                 start waiting
+
+   4 jobs listed.
+
+   root@intel-x86-64:~# systemctl list-jobs
+   No jobs running.
+
+   root@qemux86-64:~# systemd-analyze
+   Startup finished in 1.062s (kernel) + 1min 30.384s (userspace) = 1min 31.447s
+   multi-user.target reached after 1min 30.384s in userspace.
+
+You can see above that the dev-ttyUSB0.device will block for 1min 30
+seconds.  While that might not be a problem for this reference build.
+It is certainly a problem for images that have software watchdogs that
+verify the system booted up all the way to systemd completion in less
+than 90 seconds. After apply this commit:
+
+   root@qemux86-64:~# systemctl list-jobs
+   No jobs running.
+
+   root@qemux86-64:~# systemd-analyze
+   Startup finished in 1.028s (kernel) + 1.593s (userspace) = 2.621s
+   multi-user.target reached after 1.588s in userspace.
+
+This other nice effect of this change is that the fast fail device
+extend to additional serial ports that may not exist on ARM BSPs or
+that might be configured in or out by the dtb files on different
+boards.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/39381]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ units/serial-getty@.service.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/units/serial-getty@.service.in b/units/serial-getty@.service.in
+index 8b5a63d681..67534e76d9 100644
+--- a/units/serial-getty@.service.in
++++ b/units/serial-getty@.service.in
+@@ -11,7 +11,8 @@
+ Description=Serial Getty on %I
+ Documentation=man:agetty(8) man:systemd-getty-generator(8)
+ Documentation=https://0pointer.de/blog/projects/serial-console.html
+-BindsTo=dev-%i.device
++PartOf=dev-%i.device
++ConditionPathExists=/dev/%i
+ After=dev-%i.device systemd-user-sessions.service plymouth-quit-wait.service getty-pre.target
+ {% if HAVE_SYSV_COMPAT %}
+ After=rc-local.service
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/systemd/systemd_257.8.bb b/meta/recipes-core/systemd/systemd_257.8.bb
index 549eb7fb29..e466615780 100644
--- a/meta/recipes-core/systemd/systemd_257.8.bb
+++ b/meta/recipes-core/systemd/systemd_257.8.bb
@@ -29,6 +29,7 @@ SRC_URI += " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Do-not-create-var-log-README.patch \
+           file://0001-serial-getty-.service-Allow-device-to-fast-fail-if-i.patch \
            "
 
 # patches needed by musl
-- 
2.34.1


