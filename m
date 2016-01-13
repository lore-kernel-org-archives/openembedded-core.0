Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7FA765CC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 05:56:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0D5uW2O023892
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 12 Jan 2016 21:56:32 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 12 Jan 2016 21:56:31 -0800
To: Martin Jansa <martin.jansa@gmail.com>, Phil Blundell <pb@pbcl.net>
References: <cover.1452152689.git.liezhi.yang@windriver.com>
	<228ce5dac7d96467f7165add45a39cfcd12c7bfc.1452152689.git.liezhi.yang@windriver.com>
	<1452169004.3116.29.camel@pbcl.net> <20160107125502.GD2512@jama>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5695E70D.9000501@windriver.com>
Date: Wed, 13 Jan 2016 13:56:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160107125502.GD2512@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] liberation-fonts: can't be allarch
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
X-List-Received-Date: Wed, 13 Jan 2016 05:56:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Martin,

Here is a new patch which can fix allarch's mutilib dependencies issues,
can you see any potential problems with this patch, please ?

Subject: [PATCH] multilib.bbclass: extend allarch recipes

Extend allarch recipes, this can fix multilib dependencies issues, for
example:
$ bitbake lib32-run-postinsts
No 64 bit recipes should be built, but the fact was *no 32 bit* recipes
were built, this was because "bitbake lib32-run-postinsts" was the same as
"bitbake run-postinsts" since we didn't extend allarch recipes.

Extend allarch recipes just as allarch packagegroups will fix the
problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
  meta/classes/multilib.bbclass        |    4 ----
  meta/classes/multilib_global.bbclass |    4 +---
  meta/classes/package.bbclass         |    6 ------
  3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 75e91fa..514588e 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -46,10 +46,6 @@ python multilib_virtclass_handler () {
      if bb.data.inherits_class('nativesdk', e.data) or 
bb.data.inherits_class('crosssdk', e.data):
          raise bb.parse.SkipPackage("We can't extend nativesdk recipes")

-    if bb.data.inherits_class('allarch', e.data) and not 
bb.data.inherits_class('packagegroup', e.data):
-        raise bb.parse.SkipPackage("Don't extend allarch recipes which are not 
packagegroups")
-
-
      # Expand this since this won't work correctly once we set a multilib into 
place
      e.data.setVar("ALL_MULTILIB_PACKAGE_ARCHS", 
e.data.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True))

diff --git a/meta/classes/multilib_global.bbclass 
b/meta/classes/multilib_global.bbclass
index 67dc72b..2c115d5 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -143,9 +143,7 @@ python multilib_virtclass_handler_global () {

      if isinstance(e, bb.event.RecipeParsed) and not variant:
          if bb.data.inherits_class('kernel', e.data) or \
-            bb.data.inherits_class('module-base', e.data) or \
-            (bb.data.inherits_class('allarch', e.data) and\
-             not bb.data.inherits_class('packagegroup', e.data)):
+            bb.data.inherits_class('module-base', e.data):
              variants = (e.data.getVar("MULTILIB_VARIANTS", True) or "").split()

              import oe.classextend
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c51a4e8..697b4d2 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1294,9 +1294,6 @@ python emit_pkgdata() {
      if bb.data.inherits_class('kernel', d) or 
bb.data.inherits_class('module-base', d):
          write_extra_pkgs(variants, pn, packages, pkgdatadir)

-    if (bb.data.inherits_class('allarch', d) and not 
bb.data.inherits_class('packagegroup', d)):
-        write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
-
      workdir = d.getVar('WORKDIR', True)

      for pkg in packages.split():
@@ -1377,9 +1374,6 @@ python emit_pkgdata() {
      if bb.data.inherits_class('kernel', d) or 
bb.data.inherits_class('module-base', d):
          write_extra_runtime_pkgs(variants, packages, pkgdatadir)

-    if bb.data.inherits_class('allarch', d) and not 
bb.data.inherits_class('packagegroup', d):
-        write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
-
      bb.utils.unlockfile(lf)
  }
  emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse 
${PKGDESTWORK}/runtime-rprovides"
-- 
1.7.9.5

// Robert

On 01/07/2016 08:55 PM, Martin Jansa wrote:
> On Thu, Jan 07, 2016 at 12:16:44PM +0000, Phil Blundell wrote:
>> On Wed, 2016-01-06 at 23:45 -0800, Robert Yang wrote:
>>> liberation-fonts inherit fontcache which would depend on fontconfig,
>>> and fontconfig is not allarch, so that liberation-fonts can't be
>>> allarch.
>>
>> This doesn't make any sense.  I don't think allarch is, or ever has
>> been, contagious in that way.  There is no good reason I can think of
>> to require that all the dependencies of an allarch package should
>> themselves be allarch.  Indeed, if we did require this then it would
>> probably mean that virtually no packages could legitimately be allarch.
>
> Current implementation requires that, because if there is dependency on
> TUNE_PKGARCH or MACHINE_ARCH recipe, then this "allarch" recipe will be
> rebuilt (or at least different archive is unpacked from sstate) every
> single time you switch MACHINE.
>
> That's why there is SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS and
> SIGGEN_EXCLUDERECIPES_ABISAFE for sstate code to skip some dependencies
> like this - but that doesn't remove the dependency only says that the
> allarch recipe doesn't need to be rebuilt when the dependency signature
> was modified.
>
> Marking recipe as allarch incorrectly is worse than leaving it
> TUNE_PKGARCH, because as TUNE_PKGARCH it's rebuilt once per architecture
> and the stamps are valid until next metadata change, with incorrect
> allarch it's also rebuilt once per architecture (or MACHINE), but also
> unpacked from sstate every time you change the MACHINE (even when the
> resulting packages end in the same directory with the same filename -
> except when PRservice changes the last number in EXTENDPRAUTO with each
> MACHINE change).
>

