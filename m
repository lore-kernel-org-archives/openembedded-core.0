Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 17A41607AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 12:11:56 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id t14so2461750wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 04:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=cZjF3+9QZv9TPU0J8SndfFGQmCRE5uIBIp9pu2j0bHk=;
	b=fTRFaC3w5IUX5DgUJWaO4pQ+ARCxmPOqbGcEHR/VmmGEpmwvVW78USfATal9sSp2vB
	40a+/MowtwXMS8pRHthcOc8gIbeuXpoABmC4k1SkpmN3NNUNujbnRMou86jiTVP1Kju0
	UWB9sraq0b9NSsD6CabO65GjOl2yF46byGbdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cZjF3+9QZv9TPU0J8SndfFGQmCRE5uIBIp9pu2j0bHk=;
	b=Ze92rNBj6tZH8qcx0JNRP+XZfjdGesudo90GqlKPVqoCeeTTOhDPlSxBZqnl7ow4Ez
	fanxACqsEp78HEmqgTiTmrZU7zGxdB3PzhVtIVEgUcNQmMU7dxByObVE9bBOO6M1vXsQ
	l6CAz4duY6Yv1YLVBHSYGL/Uevl9T2drjEbP9x3yV+1aokJp956p0vJsSJSgRyuTjsyP
	+kPUI3h0FsE0OvOewgL9c0oaAX+dSffd91MVjKqOuffstLCO8ny2E2vOBWvpeRCNs2qw
	xUrQzf78Rv4wjeFtX8RFZx2DwaoANMdaPhCNmVZc1rj+sgE+gXE8yeJhMDUWa4LaKWL+
	hlOQ==
X-Gm-Message-State: APjAAAVQkUWAbiVOeMrM8kJglB6CGVhXYTvBB3TRH4vlbQ82mcRQi6Qq
	s1KO96BEeuw5NLAbp/++cdHmH/e6nP4=
X-Google-Smtp-Source: APXvYqwd1bmNfy78rsm10NXZxeA9I5UD0HHZY/nwLFQJH3qz/h43ILUrAZ3kvf1UaEzD9kt+hRHLCg==
X-Received: by 2002:a1c:7f87:: with SMTP id a129mr5736006wmd.156.1580904716391;
	Wed, 05 Feb 2020 04:11:56 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w19sm7557529wmc.22.2020.02.05.04.11.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 04:11:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 12:11:49 +0000
Message-Id: <20200205121151.27880-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200205121151.27880-1-richard.purdie@linuxfoundation.org>
References: <20200205121151.27880-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/6] mc: Fix manpage date indeterminism
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
X-List-Received-Date: Wed, 05 Feb 2020 12:11:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The man page date can vary depending upon the host perl, e.g. in Russian
some versions print 'июня', others 'Июнь' or Polish 'czerwca' or 'czerwiec'.
Rather than depend upon perl-native to fix this, just remove the date from
the manpages.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-extended/mc/files/nomandate.patch | 21 +++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.23.bb         |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-extended/mc/files/nomandate.patch

diff --git a/meta/recipes-extended/mc/files/nomandate.patch b/meta/recipes-extended/mc/files/nomandate.patch
new file mode 100644
index 00000000000..48bd73b1102
--- /dev/null
+++ b/meta/recipes-extended/mc/files/nomandate.patch
@@ -0,0 +1,21 @@
+The man page date can vary depending upon the host perl, e.g. in Russian
+some versions print 'июня', others 'Июнь' or Polish 'czerwca' or 'czerwiec'.
+Rather than depend upon perl-native to fix this, just remove the date from 
+the manpages.
+
+RP 2020/2/4
+
+Upstream-Status: Inappropriate [OE specficic reproducibility workaround]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: mc-4.8.23/doc/man/date-of-man-include.am
+===================================================================
+--- mc-4.8.23.orig/doc/man/date-of-man-include.am
++++ mc-4.8.23/doc/man/date-of-man-include.am
+@@ -1,5 +1,5 @@
+ SED_PARAMETERS = \
+-	-e "s/%DATE_OF_MAN_PAGE%/$${MAN_DATE}/g" \
++	-e "s/%DATE_OF_MAN_PAGE%//g" \
+ 	-e "s/%DISTR_VERSION%/@DISTR_VERSION@/g" \
+ 	-e "s{%prefix%{@prefix@{g" \
+ 	-e "s{%sysconfdir%{@sysconfdir@{g" \
diff --git a/meta/recipes-extended/mc/mc_4.8.23.bb b/meta/recipes-extended/mc/mc_4.8.23.bb
index d8c8f8643e1..ead348b92e7 100644
--- a/meta/recipes-extended/mc/mc_4.8.23.bb
+++ b/meta/recipes-extended/mc/mc_4.8.23.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://0001-Add-option-to-control-configure-args.patch \
            file://0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch \
+           file://nomandate.patch \
            "
 SRC_URI[md5sum] = "152927ac29cf0e61d7d019f261bb7d89"
 SRC_URI[sha256sum] = "238c4552545dcf3065359bd50753abbb150c1b22ec5a36eaa02c82808293267d"
-- 
2.20.1


