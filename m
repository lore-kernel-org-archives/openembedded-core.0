Return-Path: <martin@hundeboll.net>
X-Greylist: delayed 514 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 29 Oct 2014 11:27:23 UTC
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 2211060670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 11:27:23 +0000 (UTC)
Received: from hundeboll.es.aau.dk (192.38.55.25.natpool.es.aau.dk
	[192.38.55.25])
	by mail.hundeboll.net (Postfix) with ESMTPSA id EE2F31BF29B;
	Wed, 29 Oct 2014 12:18:48 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@hundeboll.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 12:18:45 +0100
Message-Id: <1414581527-5448-1-git-send-email-martin@hundeboll.net>
X-Mailer: git-send-email 2.1.2
MIME-Version: 1.0
Subject: [RFC 0/2] Explicit use of python 2
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
X-List-Received-Date: Wed, 29 Oct 2014 11:27:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I am new to yocto/openembedded, and wanted to work with yocto on Arch
Linux. As you might know, Arch has python3 as it default version, but
seamlessly supports python2 scripts by using /usr/bin/python2 instead.

This will also be needed as more and more distributions start moving to
python3. Also, it would be a reasonable guideline to require the use of
/usr/bin/env python{2,3} for future patches.

I changed (almost) all uses of #!/usr/bin/python and #!/usr/bin/env python
to /usr/bin/env python2 and did a few patches to core packages that
assumes python2.

Feedback is welcome. I especially expect problems on older Ubuntu/Debian
releases, which didn't ship with the /usr/bin/python2 symlink by default.

// Martin

Martin Hundebøll (2):
  scripts: use python2 explicitly in shebangs
  meta: rm __pycache__ in glib.inc::do_install_append()

 bitbake/bin/bitbake                                  |  2 +-
 bitbake/bin/bitbake-diffsigs                         |  2 +-
 bitbake/bin/bitbake-dumpsig                          |  2 +-
 bitbake/bin/bitbake-layers                           |  2 +-
 bitbake/bin/bitbake-prserv                           |  2 +-
 bitbake/bin/bitbake-selftest                         |  2 +-
 bitbake/bin/bitbake-worker                           |  2 +-
 bitbake/bin/bitdoc                                   |  2 +-
 bitbake/bin/image-writer                             |  2 +-
 bitbake/bin/toaster                                  | 14 +++++++-------
 bitbake/contrib/dump_cache.py                        |  2 +-
 bitbake/lib/bb/cooker.py                             |  2 +-
 bitbake/lib/bb/cookerdata.py                         |  2 +-
 bitbake/lib/bb/monitordisk.py                        |  2 +-
 bitbake/lib/bb/namedtuple_with_abc.py                |  2 +-
 bitbake/lib/bb/parse/parse_py/BBHandler.py           |  2 +-
 bitbake/lib/bb/parse/parse_py/ConfHandler.py         |  2 +-
 bitbake/lib/bb/parse/parse_py/__init__.py            |  2 +-
 bitbake/lib/bb/pysh/lsprof.py                        |  2 +-
 bitbake/lib/bb/runqueue.py                           |  2 +-
 bitbake/lib/bb/taskdata.py                           |  2 +-
 bitbake/lib/bb/ui/crumbs/builddetailspage.py         |  2 +-
 bitbake/lib/bb/ui/crumbs/builder.py                  |  2 +-
 bitbake/lib/bb/ui/crumbs/hobpages.py                 |  2 +-
 bitbake/lib/bb/ui/crumbs/imageconfigurationpage.py   |  2 +-
 bitbake/lib/bb/ui/crumbs/imagedetailspage.py         |  2 +-
 bitbake/lib/bb/ui/crumbs/packageselectionpage.py     |  2 +-
 bitbake/lib/bb/ui/crumbs/recipeselectionpage.py      |  2 +-
 bitbake/lib/bb/ui/crumbs/sanitycheckpage.py          |  2 +-
 bitbake/lib/bb/ui/hob.py                             |  2 +-
 bitbake/lib/progressbar.py                           |  2 +-
 bitbake/lib/toaster/manage.py                        |  2 +-
 .../lib/toaster/orm/fixtures/orm_views_testdata.json |  2 +-
 meta/classes/package_rpm.bbclass                     |  2 +-
 meta/lib/oeqa/runexported.py                         |  2 +-
 meta/recipes-connectivity/bind/bind_9.9.5.bb         |  2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb        |  1 +
 meta/recipes-core/glib-2.0/glib.inc                  |  3 ++-
 .../pseudo/files/0002-pseudo_force_python2.patch     | 20 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb         |  1 +
 meta/recipes-devtools/python/python-native_2.7.3.bb  |  4 ++--
 meta/recipes-devtools/python/python/cgi_py.patch     |  2 +-
 meta/recipes-devtools/python/python3-native_3.3.3.bb |  2 +-
 meta/recipes-devtools/python/python3/cgi_py.patch    |  4 ++--
 meta/recipes-devtools/qemu/qemu.inc                  |  2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc         |  2 +-
 .../use-usr-bin-env-for-python-in-xml2po.patch       |  4 ++--
 .../libglade/libglade-2.6.4/python_environment.patch |  2 +-
 .../builder/files/please_wait_dialog.py              |  2 +-
 ...001-rt-tests-Allow-for-user-specified-PYLIB.patch |  4 ++--
 ...hon-scripts-should-use-interpreter-from-env.patch |  8 ++++----
 .../createrepo/createrepo/rpm-createsolvedb.py       |  2 +-
 meta/recipes-support/createrepo/createrepo_0.4.11.bb |  4 ++--
 scripts/bitbake-whatchanged                          |  2 +-
 scripts/buildhistory-collect-srcrevs                 |  2 +-
 scripts/buildhistory-diff                            |  2 +-
 scripts/cleanup-workdir                              |  2 +-
 scripts/combo-layer                                  |  2 +-
 scripts/contrib/bbvars.py                            |  2 +-
 scripts/contrib/graph-tool                           |  2 +-
 scripts/contrib/list-packageconfig-flags.py          |  2 +-
 scripts/contrib/python/generate-manifest-2.7.py      |  2 +-
 scripts/contrib/python/generate-manifest-3.3.py      |  2 +-
 scripts/cp-noerror                                   |  2 +-
 scripts/create-recipe                                | 12 ++++++------
 scripts/jhbuild/jhbuild2oe.py                        |  2 +-
 scripts/lib/mic/bootstrap.py                         |  2 +-
 scripts/lib/mic/chroot.py                            |  2 +-
 scripts/lib/mic/conf.py                              |  2 +-
 scripts/lib/mic/creator.py                           |  2 +-
 scripts/lib/mic/imager/baseimager.py                 |  2 +-
 scripts/lib/mic/imager/fs.py                         |  2 +-
 scripts/lib/mic/imager/livecd.py                     |  2 +-
 scripts/lib/mic/imager/liveusb.py                    |  2 +-
 scripts/lib/mic/imager/loop.py                       |  2 +-
 scripts/lib/mic/imager/raw.py                        |  2 +-
 scripts/lib/mic/kickstart/__init__.py                |  2 +-
 scripts/lib/mic/kickstart/custom_commands/desktop.py |  2 +-
 .../lib/mic/kickstart/custom_commands/installerfw.py |  2 +-
 scripts/lib/mic/kickstart/custom_commands/micboot.py |  2 +-
 .../mic/kickstart/custom_commands/micpartition.py    |  2 +-
 scripts/lib/mic/kickstart/custom_commands/micrepo.py |  2 +-
 scripts/lib/mic/msger.py                             |  2 +-
 scripts/lib/mic/plugin.py                            |  2 +-
 scripts/lib/mic/pluginbase.py                        |  2 +-
 scripts/lib/mic/plugins/backend/yumpkgmgr.py         |  2 +-
 scripts/lib/mic/plugins/backend/zypppkgmgr.py        |  2 +-
 scripts/lib/mic/plugins/hook/empty_hook.py           |  2 +-
 scripts/lib/mic/plugins/imager/fs_plugin.py          |  2 +-
 scripts/lib/mic/plugins/imager/livecd_plugin.py      |  2 +-
 scripts/lib/mic/plugins/imager/liveusb_plugin.py     |  2 +-
 scripts/lib/mic/plugins/imager/loop_plugin.py        |  2 +-
 scripts/lib/mic/plugins/imager/raw_plugin.py         |  2 +-
 scripts/lib/mic/rt_util.py                           |  4 ++--
 scripts/lib/mic/utils/cmdln.py                       |  2 +-
 scripts/lib/mic/utils/errors.py                      |  2 +-
 scripts/lib/mic/utils/fs_related.py                  |  2 +-
 scripts/lib/mic/utils/gpt_parser.py                  |  2 +-
 scripts/lib/mic/utils/grabber.py                     |  2 +-
 scripts/lib/mic/utils/misc.py                        |  2 +-
 scripts/lib/mic/utils/partitionedfs.py               |  2 +-
 scripts/lib/mic/utils/proxy.py                       |  2 +-
 scripts/lib/mic/utils/rpmmisc.py                     |  2 +-
 scripts/lib/mic/utils/runner.py                      |  2 +-
 scripts/lnr                                          |  2 +-
 scripts/oe-buildenv-internal                         |  4 ++--
 scripts/oe-pkgdata-util                              |  2 +-
 scripts/oe-selftest                                  |  2 +-
 scripts/oe-trim-schemas                              |  2 +-
 scripts/opkg-query-helper.py                         |  2 +-
 scripts/pybootchartgui/pybootchartgui.py             |  2 +-
 scripts/relocate_sdk.py                              |  2 +-
 scripts/send-error-report                            |  2 +-
 scripts/swabber-strace-attach                        |  2 +-
 scripts/sysroot-relativelinks.py                     |  2 +-
 scripts/tiny/dirsize.py                              |  2 +-
 scripts/tiny/ksize.py                                |  2 +-
 scripts/wic                                          |  2 +-
 scripts/yocto-bsp                                    |  2 +-
 scripts/yocto-kernel                                 |  2 +-
 scripts/yocto-layer                                  |  2 +-
 121 files changed, 162 insertions(+), 139 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/0002-pseudo_force_python2.patch

-- 
2.1.2


