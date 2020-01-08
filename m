Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 854D67FED5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:30 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id a5so2495461wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ViMRKvhQz+jwk2wZelEX7ubSvhRt4ASfC7t1YStkxFc=;
	b=Hok0aBov2xtlT3NZuSJmYlhdxA2/sG+KACAS+JEdRxK3TE6JZ5FMU3Z9n84bgc5snQ
	T7vJvFQJOAGRDe/lAnDEIQwsruw+zATUu847ezLyK7x/MF0laJKw8WHXMKA/fEwWul3C
	3LjnHoAwLyYDBFomwUcMfDPdTfrqytPqG+/xDM+jmHHgDggVnkpuYfqjzLVwAjtsfM3a
	xdE/+SoHOZniaS9388+APKJIczW4YyWJIqA5I5+PgRQE2yetuZjUOOMOrGOSbaeGVbIy
	796zeXs9Y/ue5ww7IvXpSgS0ta+6ZEwbrqHLRKZUQ52zs78aInDtknMhW+DBCLHQCgN1
	9DVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ViMRKvhQz+jwk2wZelEX7ubSvhRt4ASfC7t1YStkxFc=;
	b=I0cLmswjAe9UgyNzs1R6Oxz5Yf79UfKl1kegl5hk3Ja9iN+SCHGrMI5K6ZOW3XkEuw
	zcSpEqJ4KJefBJFKK47+wVOX54oAiGfVjkBYHWv7M/T7lEPbHSYIX+aHrWLEHBgz1e66
	tJ7Tf7aJCis5WPRna8OP490VqGGdN+gl/Eh2c4PDs3bqn4gUad/C6cY58aKg02huJwKi
	cBiercMvTOy8J6JGsaPgMESnycQN+TyNs7jFhL3z92XnTQYbm5t4nLhpWo6oL3EUxm8B
	4syhbtZjMON3xlVjoWNySNKuvivZ4Ev7fYtHLRFpcRTsaZDaXQY0QpWkZV/854KZIpv2
	LlWg==
X-Gm-Message-State: APjAAAVMAQP4+RTMZ8BbUS9R8P/d/YeAlifq5kOmJMtpjcZCXSFLd7cC
	3Rd4Kz5DbJ9dopTQDV/CNtwDb4y5mIk=
X-Google-Smtp-Source: APXvYqxyD5TrRFRNEuEHVrzJDGkxE8IkEtXkuKjR5qi7OnEL3LQQcpxeFc5CyUZVgdc0a9kFTrYRxg==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr4075464wmh.22.1578490110863;
	Wed, 08 Jan 2020 05:28:30 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:55 +0100
Message-Id: <20200108132759.95603-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 24/28] gawk: fix failing ptests
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:30 -0000

They were failing due to incorrect locale being used.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/gawk/gawk_5.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk_5.0.1.bb b/meta/recipes-extended/gawk/gawk_5.0.1.bb
index eaba6c78eda..e79ccfdebf0 100644
--- a/meta/recipes-extended/gawk/gawk_5.0.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.0.1.bb
@@ -46,6 +46,8 @@ do_install_ptest() {
 	done
 	sed -i -e 's|/usr/local/bin|${bindir}|g' \
 	    -e 's|#!${base_bindir}/awk|#!${bindir}/awk|g' ${D}${PTEST_PATH}/test/*.awk
+
+        sed -i -e "s|GAWKLOCALE|LANG|g" ${D}${PTEST_PATH}/test/Maketests
 }
 
 RDEPENDS_${PN}-ptest += "make"
-- 
2.17.1


