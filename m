Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 71A1A9202B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 19:26:15 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q8so7174024pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 11:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XYwGieeFWzKdu9qq1GXasVW8Gnh0nJ+TD+HZ7zpOomA=;
	b=kpw7lFwVv+MelgbQ5CDfA4K9uEjrm8JJpdIK+z55P9o1pQFoIT1eE16YoTv1ZAeU72
	0763M3U7n/y+9FcfNSuEXT8dxfBLquEq4YKGTTvqg0SaWEt/wD0fg9/iZaX8kCRQXIze
	3s7yE1WL0147STCBEfCdBL5c2pu7AOSISpQwmWl9eYauldT290DlgTrCi5/qg0VM0d+4
	uZ7QtROQw64PKsls3xdhhyW37a9UcSbZsdlP5LEEUfujNd1QWYDKyM1eRftD4CtaxTdB
	xF5ogWTnp9RMXaaHR2+7QFb7K11Wd1tglJxoMWfJDTSqg+A1sEtcWtC5fJEjzUt1EZkp
	69Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XYwGieeFWzKdu9qq1GXasVW8Gnh0nJ+TD+HZ7zpOomA=;
	b=ZyE4cZQTYIB+1VJK2fC5IBQUmL4xASOYOBl+qhue4MwCsym6aod17ASuFVS7hxAUnt
	U5XXS/0lF4Ym9J7z5KMkkyIby6C7j0drAwV/aQQt7238aVrz9fQN647c1d5TMxW9JNiY
	SxqjeLZFrLZuYCqIm1NyxS13SUjiwRts9paNZ1OtMYUEXGARffAoJ3Q2WB/VS+dAebq1
	eTIyUDas8dkB8ELNL14zPAEIUX3sD51SckuwNO7PDS3URa5AeKqia2AhIMYTJichYX4t
	tWrmVwj+eLRzbH6z5prJWaOLtc1fG0fy8kWrX25941P9F2UaWQwnUiwDq7ol79efNU4v
	NTwA==
X-Gm-Message-State: APjAAAV8TgG3nnbZzjfxDTPQZJI+3G+A9Fm1d+vwKFG1jHiHKNS96+2R
	51QTQBpqyDiENXDAYcQrMjtoV1Udle8=
X-Google-Smtp-Source: APXvYqzwB+02wJ+gwuH1GxBp3fkMAzoa0/02Lo4rFx+C21uWWpBK/EFCwvMsRdBIQ41qeZRonGFeNA==
X-Received: by 2002:a63:d906:: with SMTP id r6mr26668529pgg.440.1580239576092; 
	Tue, 28 Jan 2020 11:26:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	ep2sm1161123pjb.31.2020.01.28.11.26.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 11:26:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2020 11:26:14 -0800
Message-Id: <20200128192614.635447-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] socklog: Disable the chkshsgr tests
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
X-List-Received-Date: Tue, 28 Jan 2020 19:26:15 -0000
Content-Transfer-Encoding: 8bit

Running the chkhsgr test during cross compile fails

./chkshsgr || ( cat warn-shsgr; exit 1 )
Oops. Your getgroups() returned 0, and setgroups() failed; this means
that I can't reliably do my shsgr test. Please either ``make'' as root
or ``make'' while you're in one or more supplementary groups.

All OE based targets have working getgroups()/setgroups()
implementation, so its a safe assumption and therefore make the test
to be a dummy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/runit/socklog_2.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/runit/socklog_2.1.0.bb b/meta/recipes-core/runit/socklog_2.1.0.bb
index 85c20d75a7..fc3fbd9826 100644
--- a/meta/recipes-core/runit/socklog_2.1.0.bb
+++ b/meta/recipes-core/runit/socklog_2.1.0.bb
@@ -19,6 +19,7 @@ do_compile() {
 	cd ${S}/src
 	echo "$CC -D_GNU_SOURCE $CFLAGS" >conf-cc
 	echo "$CC $LDFLAGS -Wl,-z -Wl,noexecstack" >conf-ld
+	echo "int main() { return 0; }" >${S}/src/chkshsgr.c
 	oe_runmake
 }
 
-- 
2.25.0


