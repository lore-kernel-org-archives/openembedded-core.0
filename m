Return-Path: <kergoth@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 27542719B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 16:15:16 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u1so23741644wra.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mleaZ0Btf8NnYf9CZ7hDyIg0wcvXEt78ZE9yj3Y+b8c=;
	b=k5W1DBhT48BkA2kWaW1i3/4Onscwjb5vogyZlj1WnYvXOiA27+nObuM3e9EMyC3w3C
	9ULYwbTgvm4t7buLd5+X+bDQgkHE43sf2av/aK88kj+UuNf4J9a33UC15xjmOjQOo4ms
	T5yI7RXBul4o6Ht3+VrzrPS63SHLaIzXH8ngUR6RL3Hyk5IONJthr7P02jIV4rZa+Hja
	PQikKxGWf//bJdCdk+9SepTwbbMBpgFXODbOV+ShsTqPeHVIJ4XvYupPmU5KGePWw82K
	Hvooq9U9OXFrUZrqr1HQxiZOff/CRg3NMmlz6X1Nu/SduWh2nU64WQsChhG+QL6LnmFg
	p5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mleaZ0Btf8NnYf9CZ7hDyIg0wcvXEt78ZE9yj3Y+b8c=;
	b=k379zSdEkikwLAYi8TIdaggRuee772GPGiO86G44fDpWGOD5lNJqLrUOcBNXthI2nA
	prRJhklTL+Rw2FmreYg1MFUUcF7S8pJDVtKlawTtdoruxTX+rXWHtC5w6cOjAbolmaPN
	aUEbl7O8orae6HZQ/NajzJPcPEx8zXf4alkIEnDqLiVvxTrUy3iND3oDVM7bEU6ciMa/
	QVGhG3KOBDZpW6t8AaWbn67prj3HZV3jIFmUg0hs1nmlGxl1XEN+75SAmwpbov0vnZgt
	g6Ver7sCugGJS+C1CPkkDWopvonJxjC0WqqiTXtej/80Sfxdl/7z3ZGuEPLwsrMy1TOv
	F5XQ==
X-Gm-Message-State: AFeK/H30IxDmuhbDB1BtZdUVrvn4q1QeN4iDNcj2hCxltxVN0Kd4uC9z+P7ztsCtVvjkfQ==
X-Received: by 10.223.168.120 with SMTP id l111mr23572798wrc.173.1490717717909;
	Tue, 28 Mar 2017 09:15:17 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	a18sm5462946wrc.58.2017.03.28.09.15.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Mar 2017 09:15:16 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 21:14:54 +0500
Message-Id: <f619859747304e1ed4ba32488ea416419ede955d.1490717618.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1490717618.git.chris_larson@mentor.com>
References: <cover.1490717618.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] update_gio_module_cache: fix host user contamination
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
X-List-Received-Date: Tue, 28 Mar 2017 16:15:17 -0000

From: Abdur Rehman <abdur_rehman@mentor.com>

update_gio_module_cache intercept creates file:
$D${libdir}/gio/modules/giomodule.cache

Change ownership of this file to root:root to avoid user contamination
by host.

Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/postinst-intercepts/update_gio_module_cache | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/scripts/postinst-intercepts/update_gio_module_cache
index fe468092cf..92092f2144 100644
--- a/scripts/postinst-intercepts/update_gio_module_cache
+++ b/scripts/postinst-intercepts/update_gio_module_cache
@@ -5,3 +5,5 @@ set -e
 PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
         $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
 
+chown root:root $D${libdir}/gio/modules/giomodule.cache
+
-- 
2.11.1


