Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5616E2E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 03:08:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBD3871r016364
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 19:08:08 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 12 Dec 2013 19:08:07 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Dec 2013 11:09:01 +0800
Message-ID: <cover.1386903269.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] Change the way of handling CONFFILES
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
X-List-Received-Date: Fri, 13 Dec 2013 03:08:09 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

It's a very common situation in OE/Yocto that the recipe authors/maintainers
either forget to set the CONFFILES variable or set it wrong.

For example, we don't have CONFFILES set in the shadow recipe. As a result,
/etc/login.defs from the shadow package is not treated as a config file.
Another example is the base-files recipe. We set the CONFFILES variable, but
it's not a complete list. Basically, all files under /etc should be treated as
config files for this recipe.

Such mistakes are not easy to find, because when we add or upgrade a recipe,
we usually only test whether it functions well, we don't take into consideration
the on-target upgrade process.

So we need to improve the situation here.

This patchset consists of two patches. The first one is the main patch which changes
the way CONFFILES is handled in our project. The second one serves as an example how
to fix individual recipes.

As almost all files under /etc should be considerred as config files, we don't need to
modify a lot of recipes after the first patch. Take shadow as an example. We don't need
to modify that recipe after this change. The ones that need to be paid attention to are
those that set CONFFILES in their recipes. The second patch serves as an exmple how to
fix this.

//Chen Qi

The following changes since commit ba8506ee342a1a579ceb309f3f50285eaad84f25:

  local.conf.extended: Bring into sync with OE-Core (2013-12-12 23:18:39 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/CONFFILES
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/CONFFILES

Chen Qi (2):
  packaging: change the process of CONFFILES handling
  base-files: Fix CONFFILES

 meta/classes/insane.bbclass                       |    2 +-
 meta/classes/package.bbclass                      |   35 +++++++++++++++++++++
 meta/classes/package_deb.bbclass                  |    2 +-
 meta/classes/package_ipk.bbclass                  |    2 +-
 meta/classes/package_rpm.bbclass                  |    2 +-
 meta/conf/bitbake.conf                            |    2 ++
 meta/recipes-core/base-files/base-files_3.0.14.bb |    3 --
 7 files changed, 41 insertions(+), 7 deletions(-)

-- 
1.7.9.5


