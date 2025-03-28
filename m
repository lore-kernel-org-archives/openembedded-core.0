Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A01C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 18:06:00 +0000 (UTC)
Received: from sonic314-14.consmr.mail.bf2.yahoo.com (sonic314-14.consmr.mail.bf2.yahoo.com [74.6.132.124])
 by mx.groups.io with SMTP id smtpd.web11.937.1743185154486257385
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 11:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=M+Stz5um;
 spf=neutral (domain: yahoo.com, ip: 74.6.132.124, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743185153; bh=coaboDVHbxrIjkJnkX5mLl1XNbP7leTQthTbZcLNE/E=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=M+Stz5um8bePmaEIRzHVnfwkQtCjjSFdirO5Qr2dKaR6faHu57QvmPR9aWzQBmkAjCRZGtt0QXN9aoo7E3bW33k8TDNBgChBTuwUIUAvN2sepA86Pw8TImJ4NzI0DU+9y1jJRWWbXt9LEwk27rYhFK5aUjJRdrOexAXRYvk9yEJDUQXWmXoZPO21BewfEAXmk1g0DcsjjE4LQNjHrngmaRNig+AuVnhCxCEe6nXj4XcxvZOqb71bnj4N99qAqCgxZyvTO5SGTjvM6TuWatRS7PxcjwEAzELl2Wl2HrWzf4XYaY/CH/1VUoWv3+zKMBrwMp2UsZY4duddXsAOlsaqzA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743185153; bh=Q8PZHqJxkHSeLk7xU8vrDLZyy7GX+hBNiIG2ChJAwUj=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=XAccc+ZYqDPRHEUgEmAvmYte68/HBh9RUXy14TTmZo8PacwD7XP2V0Q9yi2j77miW3GCt0DNef9+DreLisPCEexn9xlpXTs9RbIzQa17Yu6syWWpkAzMKe+KoVsENqVqMNx4myiw8rGjPCs8Z4Aqy51n6xqceUpnE3bY6Hj5ZOpIg21jyxWjEfJmYHbfb+i1RNFNinaUCW/4XfJFQ2Av2uYZfZ/FNN/uEPtLS3jcW0hOs3+PuIM1r82gP+dOiO5ADJxpy6dOUwR/JdqUToUzRZFAIBsfJcf7OSNhFP0Gx/rIgWLDuD99BfTGQOjtfy5yEoAfc6cXJQCyBpgDqC4J+w==
X-YMail-OSG: _i5KeREVM1nBkJWFX6WuSCAtvN2EewI8p6VbUabHZkEIe1OOzRraQZBXDmQi9jw
 K3Rkw3rxwVQmZKFypldUWc2VFT9TgAaoXQultCzUwRqmjaIRHTEfxB.2xZNEFTIHAm1AAg9Ke.Lz
 sYCBEGCt4yZor.cNU7qyrudUGFuNZ1hI3sf1RUmAxRuXilNP1Ieqkwn9zVvsjoW1uyuXWWHj.BIk
 Xk6JCC0SaHEjekc36kRPTAgQgCBkZQeyqDAKPQfj_zwb5ahQ1GQbzow1xued3V9.4Eq_1nqeUmMh
 kY0FiQGGn_WT.NTGTeWsYGWSjKkfPJYalC2Clcg1JMD.1Hh9KmY2uogo_es2ZYsx6gRK9eSSskun
 4HvK1EzN7MA_QTsSbL43mlgQESscHsjV7Wsm2L8ayZgoI_oFjGrw6XKiu6c0zxW248HDxyICisPW
 Avcrv5DocslpCEL_3_tROT90uS1dyoDrt1.b0vGyQfa1_b1wmk62jP6rcTiIirzMw.Ic_WkjI3qs
 TifaZYcS15Ebdu.tcNLNbCNxK5TWBIWkDnYcHVMlsS1VYYUUmG76xfKCLvForj9v62DDHfnz.OpL
 8MbjAS9CtCHBqNihti4yp51IxN05E0XZxr0BP5_G.vkG547QSiKcwiOEjHwVziv3qHBsdwHF1JZG
 N0JZ622IJ8FZRJyng2N8M71rwCb6GL5atbUaaYX_73xZO5Arydq4Fu9PIyentbhY3PumCHfSyYcI
 dJV1hIu6lRBBpcwXZ6KXIAT63CB140VmJvc.A24hNwRX0Zlv_BPQphdFgLVHPEzLwCPxB5kFQYT3
 NzvNSkP4ut0k5je0lZOn09o_6Z1_P_hEQQO4cSC16SLdYAbstKzz5.h1W0eQK0F7N8MfHrcunP_j
 owPObk4P0NxEzrNOpjqddPN1xnwuBViZrMYGtJ5patXpzyWmwkeDVWG_M8fM1ahF6dyB2qWfHvgE
 YgFLi_GOr8qfslw1M0t.CFq9iYAwBnEzk9JaxmxYjzL5.r7EEoRfcOq0Eohx9ez3Cx4ex77NO3cf
 62pIZ87bjrzIIPyZV0eGlHeoMrvtZrQbumCL3OWaf58VBCMAnOnmn74frH.qKqn8sNlV.m86iadH
 yBrzSYGefN1rGEgG1FyWp9PHHHC5gNYnJLRvvRQE6D2YVFMpP6df3TozqmqmPXTopd8G.bqyyJ2f
 7X_KMM7V.0Bj24lu.H6kEG4wgfBl2KbC_zJOS.MGbk.x.D.IduaS_T5_iLKlAS5W1yTFBTxDS0B_
 9Mq6Q8eHTb6WZFpPc7.cnOhqTcR2L5dtXmgAZ3rL79n1yX63qj9bjr8iyudVw.t1xJidRb8sreHk
 YskcGIuO7loz4ea5oVU_ZNuuvkoPLQPrRC4eM1FZS7xtMMAzDet.kIJjZcxNRy9ipUDPn153n53I
 EndgtFWSey1UnmsxoWQ.9OPwIRQrPEaJK5jqrpPwVrt6m56q8Ta4eOkYdC98D0oY1HE9RJlHXkqe
 _V85q6xeQcx3iPGlzDW3nWb.t.d_cEuE.DOzv1eOMRe6xZr7smDsidMpD9NBre4YOw_lkSKzktvy
 P5I6iQkGD7Ia0RaU4GHo_94a_uVbUSsM7sNN5ch6aFahb_V76cBuKMMAJNc.fOuRz_unT8OnPFr_
 hMLk9yjpc0WXSbOaC8PM4Af6LNFZ6zBKlHJdtSz5AlfpIRU_43sIBswq3kvm3TFnYlkMzBEsJyx7
 WO1rRgV7PhNnEXm._TOFOEBtd.uBs9HFjYg_Z3s4fQJfnZ.sDgEPo270kNOjme14R0jxjhgTgPwB
 M7uNTwKVn5m8e33Hxp36eh__tBmTVaToyVGkThFV5h5_I5wVQUfgs7SSBhs1taheErcHv56pOKkE
 tx43qB6a7q.zpXHkzcvl7906Orxxd5DGMGjZ6zjw_l6MDAf4H4.60Lg9uaXzR7roh6bsGNWI70d8
 SMMgY2cBScZ8sXfykEzn_r0BMQkO.WeOaFPNanYNyNNbtVwbHuk0h4kc4DzQ_xuwjXkHf9PsCdIn
 4qcAQya01Tv23zP60oaGIHfJjEHaT3oTDEvqZP_gr4VsVnA1jaoYtNC0MlT6AizV6fbM2R1CSEUT
 Gu2A3hpfSzlPXdURzTVYCjeEq_RzNEy7C13V2Wp1CvqImZ7l6SfX_ElB.blxdwYtVErtlhaA9OsT
 ybeuPsXI6fz.4ovhNoSI0gdQeJt0m4XroC86gq5L6DhYfjXgqqK2E5k6BN8wUvcXg3rwss3FqRTv
 u2pYxO9kY.Btu2hc2gxPt73i9ccPBfS.uWIK1Y8SCY4KVjSmeIGslJxx5Dg--
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: bfedbe45-b57b-4e50-905a-458e51467397
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Fri, 28 Mar 2025 18:05:53 +0000
Received: by hermes--production-ir2-54ff696c44-9825g (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 11e6f736a455e5ee05181f7a170c71bc;
          Fri, 28 Mar 2025 18:05:51 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Ross Burton <ross.burton@arm.com>,
	jbk <jbk@mm-software.com>
Subject: [PATCH] initramfs-framework: remove hard dependency with busybox
Date: Fri, 28 Mar 2025 19:04:56 +0100
Message-Id: <20250328180456.90413-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250328180456.90413-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 18:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213861

In 'finish'script the Switch_root command with option -c is busybox specific.
When package-core-base-utils is selected the boot is breaking.
Remove -c option to make it compatible with both providers
Fixes [YOCTO #15716]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: Ross Burton <ross.burton@arm.com>
CC: jbk <jbk@mm-software.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/finish | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index ac0de9f996..716c2f44af 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -41,7 +41,7 @@ finish_run() {
 		mount --move /sys $ROOTFS_DIR/sys
 
 		cd $ROOTFS_DIR
-		exec switch_root -c /dev/console $ROOTFS_DIR ${bootparam_init:-/sbin/init}
+		exec switch_root $ROOTFS_DIR ${bootparam_init:-/sbin/init}
 	else
 		debug "No rootfs has been set"
 	fi
-- 
2.34.1


