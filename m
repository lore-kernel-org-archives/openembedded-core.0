Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id AE4C060197
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 15:02:10 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id a15so4785063wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 07:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7MvxmSiD3ndeh4MUYeWqRg/NCjTi8pHErl9Gb1pXpUg=;
	b=LC0oBeRLPM0+I1aKiuDEEeCWTImYMAN67hEJBh+VRmN1zNva4KNQvFVRXLoCLfpB1V
	tElQnV42NsK2T7gPpzLjhxn7YY8XpYxrQ1TsXJgSHbc1dHhvxQJpzRPBM67Nt1YOyl4w
	GA0Vnw49FOfGfb6Zyh5seeYbA6zUStRQqsJo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7MvxmSiD3ndeh4MUYeWqRg/NCjTi8pHErl9Gb1pXpUg=;
	b=R7YiArorwcCoT7Bxd2LtbPwMH8PAg9Y+0vakC5AtAqaNN8lFBhEXQhCCWef4jEMcAA
	dm0hbzHlG27rWBNdg2G+BpWQwRGiRXD+kOS0d1bhb8OwJXddMtFZp80vRdX5q5KN2bwH
	w01YbLSIq1V/nPIvepwJYc8Hp4OM26NWAgWABVRCbDYBisHnNuvAHS9cTq2qWPelsTDV
	47CRxfftNLtIVgPkCvW4qA2jXUL9uadXqQdw5Sb4DWTYUtajZzmdJ+Wh3seN+tcuHSYc
	InxI6pAN+tDVKOcLOKXjD5gyB2UduAJtE1ldqkgeg8G1ZtF5IZaXTu+JrN24+hwY4nb7
	UuGQ==
X-Gm-Message-State: APjAAAVpKggY5QZ0NeldleksXqXOTd0kkq/7daLhGTiS20BkDYSU0UQ2
	aErkB9QKgDjtwlhIQnJqUbHkIMgW9Iw=
X-Google-Smtp-Source: APXvYqyVciDW+Rl3e4Jm0/zMJHJCpcJqYCZBnTWRTJ1+Ci7xQPETfUdX+GiFHUnh4czjAvLQ2DcSAw==
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr2728500wrm.4.1574348530125;
	Thu, 21 Nov 2019 07:02:10 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x6sm3805297wrw.34.2019.11.21.07.02.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 07:02:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 15:02:05 +0000
Message-Id: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] opkg: Add upstream fixes
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
X-List-Received-Date: Thu, 21 Nov 2019 15:02:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../opkg/opkg/open_inner.patch                | 150 ++++++++++++++++
 .../opkg/opkg/opkg_archive.patch              | 160 ++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.1.bb      |   2 +
 3 files changed, 312 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/open_inner.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/opkg_archive.patch

diff --git a/meta/recipes-devtools/opkg/opkg/open_inner.patch b/meta/recipes-devtools/opkg/opkg/open_inner.patch
new file mode 100644
index 00000000000..9edccda33ea
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/open_inner.patch
@@ -0,0 +1,150 @@
+From alejandro.delcastillo@ni.com Wed Nov 20 22:35:02 2019
+Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
+X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on dan.rpsys.net
+X-Spam-Level: 
+X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
+	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
+	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.2
+Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
+ [209.85.217.54]) by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPS id
+ xAKMZ0Lh008396 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128
+ verify=NOT) for <rpurdie@rpsys.net>; Wed, 20 Nov 2019 22:35:02 GMT
+Received: by mail-vs1-f54.google.com with SMTP id a143so842733vsd.9
+        for <rpurdie@rpsys.net>; Wed, 20 Nov 2019 14:35:02 -0800 (PST)
+X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
+ s=20161025;
+ h=x-original-authentication-results:x-gm-message-state:delivered-to
+ :from:to:cc:subject:date:message-id:in-reply-to:references
+ :mime-version:content-transfer-encoding;
+ bh=KhZ2BZSLg854tEjeyRybBtwjcbtPiM0dOPJA6ODniyc=;
+ b=gWeCNByEKyLw0dgzMAzHowAbjPywF8aHCjjjDOeFB/48Lr/e3A42S47HsxON9j+BoP
+ Ai2HT0MOqAIRWqz3tQM/1Q9mXOy0PNU2Dqpzu5u7QCZeoFX1XpXH0hbVn+JOdg3bcPwn
+ Nm+A/vS1By4S8c0EGQ+JQ6EBMc4xtpG8rOKiPuAtj5FlRVIQ1/AM8fEMrtQfFemBbIoO
+ KhGQVSmXg9CQKzPBoFR+IgiiKuUJjKBAcz7gzvQjJ6y/sCKUtk3FE8QUNeGqMGQXkD1/
+ XEWZq2qLjkEezUbqW+ixeaWUlN7EqTn0YT+g5sO9tEL4xoUR3w9KwCkdwOvUlgEftbUB aPCA==
+X-Original-Authentication-Results: mx.google.com;       spf=pass
+ (google.com: domain of prvs=222760f524=alejandro.delcastillo@ni.com
+ designates 148.163.156.75 as permitted sender)
+ smtp.mailfrom="prvs=222760f524=alejandro.delcastillo@ni.com";      
+ dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ni.com
+X-Gm-Message-State:
+ APjAAAWPWaQQBF8I9vWh3dmrrR3q+FLW/OiQFoIv220MYnIHfdNqqufD
+ I54SM2ZkAI8VGILL5cnno25yyFO4MmqyzLBlkBkUHPoMGpk1l8U6Gg==
+X-Received: by 2002:a67:f649:: with SMTP id
+ u9mr3437665vso.20.1574289295541; Wed, 20 Nov 2019 14:34:55 -0800 (PST)
+X-Forwarded-To: rpurdie@rpsys.net
+X-Forwarded-For: richard.purdie@linuxfoundation.org rpurdie@rpsys.net
+Delivered-To: richard.purdie@linuxfoundation.org
+Received: by 2002:a67:ca9b:0:0:0:0:0 with SMTP id a27csp2232978vsl;
+        Wed, 20 Nov 2019 14:34:53 -0800 (PST)
+X-Google-Smtp-Source:
+ APXvYqzu0124T/A2v8nyGwvi00K3wFZx5WfkgZyaqKf27zfmydLbudST3y3wGviqkEtUN4fkFdsl
+X-Received: by 2002:a17:902:d901:: with SMTP id
+ c1mr5251580plz.93.1574289293448; Wed, 20 Nov 2019 14:34:53 -0800 (PST)
+ARC-Seal: i=1; a=rsa-sha256; t=1574289293; cv=none; d=google.com;
+ s=arc-20160816;
+ b=wICD7meblSbVcD2gv1eC5y6GdeaaEHOHrP5D7it3PNtBwqNTqRmU1F8UJWdOdmsbKu
+ JSKc9assSlXVI9F7Bu+ZsczsEbA9MqWxKmgPLS5YHVTCMU3QRwTX1uLMtdeEUmCDo2+N
+ edCAO1bdrNbsM1Yhu/7nur8mBRrmcP/2uq4cgvfV03/1i1x3YiRiLmEj/WaU1V2oGzjL
+ F8lQpfIQIcIbX0dlq28GnJKntNSDe++OMLBwlhxY5FR+lCaXhf91kw/WndILbB99U0yf
+ 6FkzOxwcTbLLahDdHDgVmtk+grUVcz0N7HnRM5Wj8FqAmbtetw/NnWovsUMUlbQRvQm5 /xKA==
+ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
+ s=arc-20160816;
+ h=content-transfer-encoding:mime-version:references:in-reply-to
+ :message-id:date:subject:cc:to:from;
+ bh=KhZ2BZSLg854tEjeyRybBtwjcbtPiM0dOPJA6ODniyc=;
+ b=MIgWm3wUiLmTZuhjNXKsih84SdE0NfFoXpMJqshToFqGG8ElxCzyorlvK+0PGjN428
+ O/vMXpqOqd1iR6IZ9/wEb3JsHOrOxNWFwA1MVp/QkSKQwhjvRNl62i5C7fl7idVwuUl/
+ 7EZJZ4ZYTXEGUv+wIUuij+MAffGrqQDg0Ubd9ccVymjPA6nDLryHEbWrUepJVnKPd3nQ
+ iJxxkYgBP8QP3Aq/a3QNxqxXdMilrGeMljx0wpWwKqkBEvC913vISPJZ0nLbxglYzebM
+ K3B2Ksf4Ct7C/dXPAUjkt5mtLDYT6mZ7v8oFesgsbxvIHlKe6CCry0a5wYUqaSvfElfY V6kA==
+ARC-Authentication-Results: i=1; mx.google.com; spf=pass (google.com:
+ domain of prvs=222760f524=alejandro.delcastillo@ni.com designates
+ 148.163.156.75 as permitted sender)
+ smtp.mailfrom="prvs=222760f524=alejandro.delcastillo@ni.com"; dmarc=pass
+ (p=NONE sp=NONE dis=NONE) header.from=ni.com
+Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com.
+ [148.163.156.75]) by mx.google.com with ESMTPS id
+ 4si680517plb.245.2019.11.20.14.34.53 for
+ <richard.purdie@linuxfoundation.org> (version=TLS1_2
+ cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Wed, 20 Nov 2019 14:34:53
+ -0800 (PST)
+Received-SPF: pass (google.com: domain of
+ prvs=222760f524=alejandro.delcastillo@ni.com designates 148.163.156.75 as
+ permitted sender) client-ip=148.163.156.75;
+Authentication-Results: mx.google.com; spf=pass (google.com: domain of
+ prvs=222760f524=alejandro.delcastillo@ni.com designates 148.163.156.75 as
+ permitted sender)
+ smtp.mailfrom="prvs=222760f524=alejandro.delcastillo@ni.com"; dmarc=pass
+ (p=NONE sp=NONE dis=NONE) header.from=ni.com
+Received: from pps.filterd (m0098781.ppops.net [127.0.0.1]) by
+ mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
+ xAKMRxBj018942; Wed, 20 Nov 2019 16:34:52 -0600
+Received: from ni.com (skprod3.natinst.com [130.164.80.24])
+	by mx0a-00010702.pphosted.com with ESMTP id 2wae13ps20-1
+	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
+	Wed, 20 Nov 2019 16:34:52 -0600
+Received: from us-aus-exch2.ni.corp.natinst.com
+ (us-aus-exch2.ni.corp.natinst.com [130.164.68.12]) by
+ us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
+ xAKMYpHv003993 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256
+ verify=NOT); Wed, 20 Nov 2019 16:34:51 -0600
+Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
+ us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP Server
+ (TLS) id 15.0.1395.4; Wed, 20 Nov 2019 16:34:51 -0600
+Received: from delcastillo3.natinst.com (172.18.68.32) by
+ us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
+ Server id 15.0.1395.4 via Frontend Transport; Wed, 20 Nov 2019 16:34:51
+ -0600
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+To: <opkg-devel@googlegroups.com>, <richard.purdie@linuxfoundation.org>
+CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Subject: [opkg][PATCH 2/2] open_inner: add support for empty payloads
+Date: Wed, 20 Nov 2019 16:34:48 -0600
+Message-ID: <20191120223448.26522-3-alejandro.delcastillo@ni.com>
+X-Mailer: git-send-email 2.22.0
+In-Reply-To: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+References: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+MIME-Version: 1.0
+Content-Type: text/plain
+X-Proofpoint-Virus-Version: vendor=fsecure
+ engine=2.50.10434:6.0.95,18.0.572
+ definitions=2019-11-20_07:2019-11-20,2019-11-20 signatures=0
+X-Proofpoint-Spam-Reason: safe
+X-Virus-Scanned: clamav-milter 0.101.4 at dan
+X-Virus-Status: Clean
+X-Evolution-Source: 1525863794.3857.16@hex
+Content-Transfer-Encoding: 8bit
+
+Support for empty compressed payloads need to be explicitly enabled on
+libarchive.
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+
+Upstream-Status: Backport
+---
+ libopkg/opkg_archive.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 0e9ccea..f19cece 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -618,6 +618,13 @@ static struct archive *open_inner(struct archive *outer)
+         goto err_cleanup;
+     }
+ 
++    r = archive_read_support_format_empty(inner);
++    if (r != ARCHIVE_OK) {
++        opkg_msg(ERROR, "Empty format not supported: %s\n",
++                 archive_error_string(inner));
++        goto err_cleanup;
++    }
++
+     r = archive_read_open(inner, data, NULL, inner_read, inner_close);
+     if (r != ARCHIVE_OK) {
+         opkg_msg(ERROR, "Failed to open inner archive: %s\n",
+-- 
+2.22.0
+
+
diff --git a/meta/recipes-devtools/opkg/opkg/opkg_archive.patch b/meta/recipes-devtools/opkg/opkg/opkg_archive.patch
new file mode 100644
index 00000000000..56a275a2342
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/opkg_archive.patch
@@ -0,0 +1,160 @@
+From alejandro.delcastillo@ni.com Wed Nov 20 22:35:01 2019
+Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
+X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on dan.rpsys.net
+X-Spam-Level: 
+X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
+	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
+	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.2
+Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
+ [209.85.222.41]) by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPS id
+ xAKMZ0gk008395 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128
+ verify=NOT) for <rpurdie@rpsys.net>; Wed, 20 Nov 2019 22:35:01 GMT
+Received: by mail-ua1-f41.google.com with SMTP id p18so339793uar.7
+        for <rpurdie@rpsys.net>; Wed, 20 Nov 2019 14:35:01 -0800 (PST)
+X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
+ s=20161025;
+ h=x-original-authentication-results:x-gm-message-state:delivered-to
+ :from:to:cc:subject:date:message-id:in-reply-to:references
+ :mime-version:content-transfer-encoding;
+ bh=Y9OOjY7NCD3Wm+XzvK+9TzmDhgbtPVQl7aMAusdzDho=;
+ b=XjoAkiz0bsIvromNySMA4g4jfIJopfXAr8WYyCO5/I74DxBvUelc2e/2DyZYt5VYuW
+ NaMD9rSCOk9gn+ld+INdJmH3ceuPGZm1Y4kgLVCTL7IknlPWjuJtWL599/8lrn4uhVWD
+ cOwFsyu09EPjYvGzwjqxqf8Wca+HgymmDV/vor92kqu2trl8CsWC835pFG0a8/B4rAYH
+ hOMhvqeU+UrkMe5iyIzB4L6nBX3Gwwgt8EI+W2mgWh6W8HwLfdrv9IOKWj00V98xU9Nn
+ gUEGsCeQa1/bo5qYY1Z/w/lotR0vVJu6B+w/V/d/cniuciVnsEyfEQmBjebT8746mzz+ dTnw==
+X-Original-Authentication-Results: mx.google.com;       spf=pass
+ (google.com: domain of prvs=222760f524=alejandro.delcastillo@ni.com
+ designates 148.163.156.75 as permitted sender)
+ smtp.mailfrom="prvs=222760f524=alejandro.delcastillo@ni.com";      
+ dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ni.com
+X-Gm-Message-State:
+ APjAAAX1zcx9B1j4E7KLRgNh2OtNUmWztKYgWCXumfNL62Clsc75k1g+
+ 8eUvzPiRBh6riiNx3HKjZJOp30ExyEMZgztnyB9JpBxhwfzt2ttNog==
+X-Received: by 2002:ab0:2618:: with SMTP id
+ c24mr3345925uao.75.1574289294734; Wed, 20 Nov 2019 14:34:54 -0800 (PST)
+X-Forwarded-To: rpurdie@rpsys.net
+X-Forwarded-For: richard.purdie@linuxfoundation.org rpurdie@rpsys.net
+Delivered-To: richard.purdie@linuxfoundation.org
+Received: by 2002:a67:ca9b:0:0:0:0:0 with SMTP id a27csp2232973vsl;
+        Wed, 20 Nov 2019 14:34:53 -0800 (PST)
+X-Google-Smtp-Source:
+ APXvYqyxMeKT9TRfjbvSZeBERtCkHKj+Y0dywybZSRWjh2KpKGAS3ujTon8MetFDJPz/XaV9C4CN
+X-Received: by 2002:a17:902:8bc9:: with SMTP id
+ r9mr4994639plo.319.1574289293016; Wed, 20 Nov 2019 14:34:53 -0800 (PST)
+ARC-Seal: i=1; a=rsa-sha256; t=1574289293; cv=none; d=google.com;
+ s=arc-20160816;
+ b=04u3YSzfPN0+WkK0LLFKW07PbOQyk5T2b4rCKit5CG/Ec1pY+E6UTqRdu/fbhIJ2Xo
+ qmpdqhcieKhtvY5kx+S28NLXszEPZcAIjNnXepU1qvTZXnCkNfXyJFSPGLDmLTGLEdUB
+ TktdoM4IjNjOx4qwRnqdTdLV66cWGB7ojNTAih6qYb0t+2fgv70uiElgjxiTfhNTke22
+ GaSyUo4vnzAekGOVPJwLqqS7gkElQro7NM2rlW2J3UEWyrMy0Gj4BuVFszxzAu8mazqT
+ XtrsWLuzSGRjYA2EtNj8+62lABsaWuxPy5x/9VX8bblNZIu2GqaHC/AO0nQkDqf8cX9q TmiA==
+ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
+ s=arc-20160816;
+ h=content-transfer-encoding:mime-version:references:in-reply-to
+ :message-id:date:subject:cc:to:from;
+ bh=Y9OOjY7NCD3Wm+XzvK+9TzmDhgbtPVQl7aMAusdzDho=;
+ b=mRussZx0Qx8Lxch1ZO1ZDWs4BKZNLsgzwIdr1z6rVp7/cI+CPBebzvrEPoqBji+ta6
+ m1gpgsPum3Vg3JHHvFCNz/Pon4ygv4KIVSphBcgjti+2qnoRn48H4YvCirHZ4mDR6h3u
+ rhl6Ojls0KI0YIiidpTRphIbS0vpBbkI/PUGkfVJzxQaEYuJa4TIQq2bmsrCImVwuBZs
+ t2ktebY1vt+ZBKPVq43CsAiMl1Srr/50sBhOk5NFkiaBVDJQzIj1kI7bnU3zktBaGdOK
+ 1jDpOoOnBV3SVe2M8eb38+Ge8AdL4jdMVGbdXfzXUWvF1eNgZRmkQVe1mRw4SwBnPsgs f64g==
+ARC-Authentication-Results: i=1; mx.google.com; spf=pass (google.com:
+ domain of prvs=222760f524=alejandro.delcastillo@ni.com designates
+ 148.163.156.75 as permitted sender)
+ smtp.mailfrom="prvs=222760f524=alejandro.delcastillo@ni.com"; dmarc=pass
+ (p=NONE sp=NONE dis=NONE) header.from=ni.com
+Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com.
+ [148.163.156.75]) by mx.google.com with ESMTPS id
+ 21si715567pgq.469.2019.11.20.14.34.52 for
+ <richard.purdie@linuxfoundation.org> (version=TLS1_2
+ cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Wed, 20 Nov 2019 14:34:53
+ -0800 (PST)
+Received-SPF: pass (google.com: domain of
+ prvs=222760f524=alejandro.delcastillo@ni.com designates 148.163.156.75 as
+ permitted sender) client-ip=148.163.156.75;
+Authentication-Results: mx.google.com; spf=pass (google.com: domain of
+ prvs=222760f524=alejandro.delcastillo@ni.com designates 148.163.156.75 as
+ permitted sender)
+ smtp.mailfrom="prvs=222760f524=alejandro.delcastillo@ni.com"; dmarc=pass
+ (p=NONE sp=NONE dis=NONE) header.from=ni.com
+Received: from pps.filterd (m0098780.ppops.net [127.0.0.1]) by
+ mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
+ xAKMSIJ5016740; Wed, 20 Nov 2019 16:34:52 -0600
+Received: from ni.com (skprod3.natinst.com [130.164.80.24])
+	by mx0a-00010702.pphosted.com with ESMTP id 2wafh16muy-1
+	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
+	Wed, 20 Nov 2019 16:34:52 -0600
+Received: from us-aus-exch2.ni.corp.natinst.com
+ (us-aus-exch2.ni.corp.natinst.com [130.164.68.12]) by
+ us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
+ xAKMYpHw003993 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256
+ verify=NOT); Wed, 20 Nov 2019 16:34:51 -0600
+Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
+ us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP Server
+ (TLS) id 15.0.1395.4; Wed, 20 Nov 2019 16:34:51 -0600
+Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
+ us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP Server
+ (TLS) id 15.0.1395.4; Wed, 20 Nov 2019 16:34:50 -0600
+Received: from delcastillo3.natinst.com (172.18.68.32) by
+ us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
+ Server id 15.0.1395.4 via Frontend Transport; Wed, 20 Nov 2019 16:34:50
+ -0600
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+To: <opkg-devel@googlegroups.com>, <richard.purdie@linuxfoundation.org>
+CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Subject: [opkg][PATCH 1/2] opkg_archive.c: avoid double free on uncompress
+ error
+Date: Wed, 20 Nov 2019 16:34:47 -0600
+Message-ID: <20191120223448.26522-2-alejandro.delcastillo@ni.com>
+X-Mailer: git-send-email 2.22.0
+In-Reply-To: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+References: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+MIME-Version: 1.0
+Content-Type: text/plain
+X-Proofpoint-Virus-Version: vendor=fsecure
+ engine=2.50.10434:6.0.95,18.0.572
+ definitions=2019-11-20_07:2019-11-20,2019-11-20 signatures=0
+X-Proofpoint-Spam-Reason: safe
+X-Virus-Scanned: clamav-milter 0.101.4 at dan
+X-Virus-Status: Clean
+X-Evolution-Source: 1525863794.3857.16@hex
+Content-Transfer-Encoding: 8bit
+
+The open-inner function calls archive_read_open. On error,
+archive_read_open calls inner_close, which also closes the outter
+archive. On error, return NULL directly to avoid double free.
+
+
+Upstream-Status: Backport
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+ libopkg/opkg_archive.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 3d87db1..0e9ccea 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -622,7 +622,7 @@ static struct archive *open_inner(struct archive *outer)
+     if (r != ARCHIVE_OK) {
+         opkg_msg(ERROR, "Failed to open inner archive: %s\n",
+                  archive_error_string(inner));
+-        goto err_cleanup;
++        return NULL;
+     }
+ 
+     return inner;
+@@ -683,7 +683,7 @@ static struct archive *extract_outer(const char *filename, const char *arname)
+ 
+     inner = open_inner(outer);
+     if (!inner)
+-        goto err_cleanup;
++        return NULL;
+ 
+     return inner;
+ 
+-- 
+2.22.0
+
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
index 149ee3ca190..f0ae8b36bd1 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
@@ -14,6 +14,8 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://opkg_archive.patch \
+           file://open_inner.patch \
            file://run-ptest \
 "
 
-- 
2.20.1


