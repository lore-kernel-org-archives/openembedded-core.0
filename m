Return-Path: <jonatan.palsson@pelagicore.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB95719C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 11:02:46 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f82so137909806wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 03:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/5UVqTHFYc9zpu4HWSNKbEAPZ1EWD5roebUXwcOLj3Y=;
	b=opQBhUVcaBjaFskhJEcmyeQqFX0Dk6pVTY43DlwmNf4nJ2uNndJHnF73T6GSLDtidz
	hy3oQ+r+IWwSbrQqZ39Liv4SeIKSTLMj1R+OAIWErNguPaWfZ4c27PkJmIjM70xBHX0Z
	zBCoodBoZEjcTPvA6K3pste8Kn4Tk2D9tkPiEoTKpVDwB0Lyp4GDEkhl2Gxx9GV6EV/P
	8UVgNtxtUiUEJnoSY+JPrEaeGuqd63MAhjWnRVHKRdBChuz7OHRJIzL1vI0J4hA8jGz+
	EO8TpZxjBJFmAVwuGkjlawCqPxnRwJC/p6kkpETenEvFr+XZ8LI490OIstIv9IvAEp6O
	xIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/5UVqTHFYc9zpu4HWSNKbEAPZ1EWD5roebUXwcOLj3Y=;
	b=RV6mzp2H9DPZw87/BZfPp11+fTwhUgRwH+XF8EXBogj40M4WixNBKHMvFdFxBotZVM
	dhT+IW3eOKIsGpg55tZwWe/aFJUxToVBLdP1oFlg3pfPIC3c0NH8OJRp/r8qY/wOZV1g
	vZ2Vsnrc1rmjqdllOYG8wmeKRxBL3nSb6A07oV0nxlCTXrP8ddh6LfKrnngTKD2zkkzl
	S4csnzMBYeBpfW78do7LodgD5Hv0WcvJOV4KNwVmerwg0BqKrPr7/x87QWh4R4F12xzB
	lykvv2A8trSQD4iHarwR0YwZp0Tes+qIAA2cBxllWonWGM6TEl2Ougc3AmOlyJ0DFlU3
	hMSQ==
X-Gm-Message-State: AKaTC01+VDWCRE/+5Nb1/yGgSXj3zmFC6reu7MCW1Bo2cUmtoBdDWASaXgPJAw7hZO7nQKPE
X-Received: by 10.28.157.137 with SMTP id g131mr13468231wme.29.1479726166902; 
	Mon, 21 Nov 2016 03:02:46 -0800 (PST)
Received: from wheezy6.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	m145sm18831186wma.3.2016.11.21.03.02.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Nov 2016 03:02:45 -0800 (PST)
From: =?UTF-8?q?Jonatan=20P=C3=A5lsson?= <jonatan.palsson@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 12:02:24 +0100
Message-Id: <20161121110224.21727-1-jonatan.palsson@pelagicore.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] systemd.bbclass: Support . in instance strings
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
X-List-Received-Date: Mon, 21 Nov 2016 11:02:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This modified regular expression allows systemd instance strings (the
string between @ and .service) to contains dots, which is useful for
file names which contain dots. The previous regular expression would
stop matching at the first dot, while this expression stops matching at
the last dot.

Signed-off-by: Jonatan Pålsson <jonatan.palsson@pelagicore.com>
---
 meta/classes/systemd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index d56c760..9131b82 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -151,7 +151,7 @@ python systemd_populate_packages() {
                 # 'ifplugd@.service'
                 base = None
                 if service.find('@') != -1:
-                    base = re.sub('@[^.]+.', '@.', service)
+                    base = re.sub("@.*\.(?=[^.]*$)", '@.', service)
 
                 for path in searchpaths:
                     if os.path.exists(oe.path.join(d.getVar("D", True), path, service)):
-- 
2.10.2


