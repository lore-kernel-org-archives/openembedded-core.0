Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id EBDC06004D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 01:33:52 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id p12so1753843pgn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 18:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=b38UlXROed1H5P+JDVx0q0qpOzuIEtI2fzOHKucqlyE=;
	b=EErNhwxdkt3DzWh5QnXqu2BoWsGaO85LAu4ywQXWCp1t69WuFT+HzGyO8vGXZl1zj+
	nyxjLCUT7VRgkcVs8ig2VTGW8skJYL22qkuIydc6qhPTdggbbXFa5E64ZSxMLIl18B+s
	tCTDuy91u6IfnCqIcXkWYr24K23zJb7l5Ph08KxeDAsuwEZuKLcN/cU2YFJ+RFvsEX0H
	1LHvig5ZpmzaVhMsOXQdgCsxsD0Xqe11tOVQJaVwEsMWqNvrw/2c7rmITD59GgFrQOg2
	golQgOyIBXSNVo5S4dwHSdXXcR72dZUHPcnQlzXnJGsjz0ELH0muq4bLL95qy6jMb7Te
	/9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=b38UlXROed1H5P+JDVx0q0qpOzuIEtI2fzOHKucqlyE=;
	b=GzRkvHd700uGmEG/FgVn70bu7VDH/nsgyZiBTiGfAR2dy+eER7px9sAMYIx0CfgjVK
	NZxRNbPtS1yrIRJY7SwqzN2laPxUrNRrp+DXdt1b0aXX8689oMHtE+FSwjR03uPo1XYF
	neuDZU0sFMXPEjuRiJzem3aUgCZ46HjSrNefO3YTyM+DMT7RPrygdX+svO1M6ICwyjU5
	tbdefOLRj7weGsrdICmkXEJgWOFiYL7IG/UAM1NCVx50+iz8Z/HQmiDEoWpFWzPwmQGa
	x+g+uYbIe38LTjAfnIDz/vVI0YtZsy2odUcTWCWvbIMitvWaFoqgI4GeDpm33kK+EUqB
	ILhQ==
X-Gm-Message-State: APjAAAXHasbLsiXM0oKQzjpq/GhIDO3mO7TEpl+6SRV/qL+6+q3eIhaB
	XEThNYdjaxgW5o3Y8EwOrfjrofB5
X-Google-Smtp-Source: APXvYqzSe/Nz+nhTXVmdArqcgb2d4mJl5Iq8qCQSUQzTOISHa4hwWzxfSn8FzCRCnHmGqL6abjFTMA==
X-Received: by 2002:a65:62d2:: with SMTP id m18mr35490045pgv.117.1571103233796;
	Mon, 14 Oct 2019 18:33:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:1c7e:9ce6:b4cb:b655])
	by smtp.gmail.com with ESMTPSA id
	b20sm22710629pff.158.2019.10.14.18.33.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Oct 2019 18:33:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 18:33:42 -0700
Message-Id: <4972582767a3325d22a16db9a5479c2d0001964b.1571103112.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571103112.git.akuster808@gmail.com>
References: <cover.1571103112.git.akuster808@gmail.com>
Subject: [thud 1/7] kernel.bbclass: fix installation of modules signing certificates
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
X-List-Received-Date: Tue, 15 Oct 2019 01:33:53 -0000

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

If one has provided external key/certificate for modules signing, Kbuild
will skip creating signing_key.pem and will write only signing_key.x509
certificate. Thus we have to check for .x509 file existence rather than
.pem one.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2527e731eba43bd36d0ea268aca6b03155376134)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index bd185e2..c72d1fe 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -451,7 +451,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-	if [ -e certs/signing_key.pem ]; then
+	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
 		mkdir -p $kerneldir/certs
-- 
2.7.4


