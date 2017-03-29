Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 245AD77CCF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 11:30:17 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id y18so147814797itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 04:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xkwHQZ/vHnNoW64LrDCRA8fEjjlT1DjSzmDi3TBAKCs=;
	b=OrbFhtU5XZ0Md+91GxdgOGpVH6mkyBd+XmM4S8PePceuGCTmpmglaQAgW/jSKb6GW6
	9/WSGok+Hio/jqGrDUYk7qw5dehJt+5tuuhHjSLD5WtfH89vKzUShfq8cZoPy0RwvNRO
	D4xgbGfck4suW3ffseW2c28Qo3FqPj5+nYI0nr2wDhH2cSuEe5MyNUZhov3o2MdtLSch
	kAKcEfODhjN5YHhGsPGAxz5y+yMiMLagwkqadiNcLXXl0UxIXdzwdyCw70NRlpMejxqr
	yeqg1RZvr9QZmPHTxNrYxT3sXqPMgeTT9K3VfPmEfKdJKs2tWL543TcMia1fVsd1BD4f
	jiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xkwHQZ/vHnNoW64LrDCRA8fEjjlT1DjSzmDi3TBAKCs=;
	b=hLywh6rxSDoLmM9u8j1brxdGAuSkYwS9udUcmwLiJ9NRBsjuPb2sNjjrE4jx8NOYXK
	FK8H0yPHno31daYd2CL9xsuDvh9/MrN2cbtVcfElMtMKGQsIYJ5scdYBpK3AcS9amOfN
	uNCm8tHVPHpMxZXvNQG4f3tYSupo1SU3fNHI1jg/hHOOkBmxoPB1/rmmO4Ru6kXXcSlY
	653jTSQbux7rCbmFUmGWKcNdeiPQP22PvKItCDA5pQ1TjhORKZsVggzhCv+XAWZfk+M1
	4tZ65sRitkwmywnTw4vpTmuXBoDyilO97o9XTA53P3EJJGaidBMM6IAGd6izjSXnq7s8
	doZA==
X-Gm-Message-State: AFeK/H2psv1trpjRchZ+wb3809TkC1xnqLpNiD2Zkird20hvmzeDA7ENAx/H+vYS20BHwVGZ
X-Received: by 10.36.138.129 with SMTP id v123mr220336itd.108.1490787019209;
	Wed, 29 Mar 2017 04:30:19 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D6D7.dip0.t-ipconnect.de.
	[93.232.214.215]) by smtp.gmail.com with ESMTPSA id
	d196sm3579511ioe.3.2017.03.29.04.30.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Mar 2017 04:30:18 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 13:29:50 +0200
Message-Id: <c31440874d6a41b98fe3f8aacbc5666fd68c9635.1490786957.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.425c03862da4e6657583439f3eb42e3c88fb71ac.1490786957.git-series.patrick.ohly@intel.com>
References: <cover.425c03862da4e6657583439f3eb42e3c88fb71ac.1490786957.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/2] populate_sdk_ext.bbclass: enhance compatibility with rm_work.bbclass
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
X-List-Received-Date: Wed, 29 Mar 2017 11:30:18 -0000

"bitbake -c populate_dsk_ext" must not trigger do_rm_work, because it
is impossible to declare that the additional tasks activated by "-c
populate_dsk_ext" must run before do_rm_work. When do_populate_dsk_ext
and do_rm_work are both active, the resulting race condition breaks
do_populate_dsk_ext.

The existing bitbake dependencies can't be used for that, because
"addtask populate_dsk_ext before do_rm_work" would then always execute
populate_dsk_ext also in normal builds.

do_populate_dsk_ext triggers do_rm_work indirectly through the
dependency on do_build of the SDK_TARGETs. Using the new
do_build_without_rm_work instead (when available, with do_build as
before if not) avoids the problem.

However, one has to be careful to not trigger do_rm_work in the same
build in some other way.  "bitbake core-image-sato:do_populate_sdk_ext
core-image-sato:do_build" still fails, for example. Doing one after
the other works.

Fixes: [YOCTO 11042]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 3bccb14..db822bf 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -656,7 +656,12 @@ do_populate_sdk_ext[depends] = "${@d.getVarFlag('do_populate_sdk', 'depends', Fa
                                 ${@'meta-world-pkgdata:do_collect_packagedata' if d.getVar('SDK_INCLUDE_PKGDATA') == '1' else ''} \
                                 ${@'meta-extsdk-toolchain:do_locked_sigs' if d.getVar('SDK_INCLUDE_TOOLCHAIN') == '1' else ''}"
 
-do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in d.getVar('SDK_TARGETS').split()])}"
+# We must avoid depending on do_build here if rm_work.bbclass is active,
+# because otherwise do_rm_work may run before do_populate_sdk_ext itself.
+# We can't mark do_populate_sdk_ext and do_sdk_depends as having to
+# run before do_rm_work, because then they would also run as part
+# of normal builds.
+do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':' + (d.getVar('RM_WORK_BUILD_WITHOUT') or 'do_build') for x in d.getVar('SDK_TARGETS').split()])}"
 
 # Make sure code changes can result in rebuild
 do_populate_sdk_ext[vardeps] += "copy_buildsystem \
-- 
git-series 0.9.1

