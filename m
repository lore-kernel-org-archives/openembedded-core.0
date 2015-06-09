Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 68E0565C78
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 08:59:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Jun 2015 01:59:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,579,1427785200"; d="scan'208";a="743502134"
Received: from alefebvr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.29.139])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2015 01:59:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ChenQi <Qi.Chen@windriver.com>
Date: Tue, 09 Jun 2015 09:59:23 +0100
Message-ID: <238975671.6klxb71QiN@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <55768AB1.9090607@windriver.com>
References: <cover.1432706896.git.Qi.Chen@windriver.com>
	<4741340.pDCvDy9tKk@peggleto-mobl.ger.corp.intel.com>
	<55768AB1.9090607@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] populate_sdk_ext: consider custom configuration in local.conf
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
X-List-Received-Date: Tue, 09 Jun 2015 08:59:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 June 2015 14:41:53 ChenQi wrote:
> On 06/04/2015 10:11 PM, Paul Eggleton wrote:
> > On Wednesday 27 May 2015 14:09:39 Chen Qi wrote:
> >> Copy the contents of local.conf under TOPDIR into the final generated
> >> local.conf. In this way, custom settings are also made into the final
> >> local.conf like IMAGE_INSTALL, DISTRO_FEATURES, VIRTUAL-RUNTIME_xxx, etc.
> >> 
> >> Before this change, installing extensible SDK would usually report
> >> failure
> >> when preparing the build system if the user has custom configuration for
> >> DISTRO_FEATURES in local.conf. Also, items in IMAGE_INSTALL_append in
> >> local.conf also don't get built correctly.
> >> 
> >> This patch solves the above problem.
> >> 
> >> A blacklist mechanism is also introduced so that we can blacklist
> >> variables
> >> that should not be copied into the final local.conf file. Currently, the
> >> blacklist contains 'TMPDIR', 'SSTATE_DIR', 'DL_DIR', 'STAMPS_DIR',
> >> 'BASE_WORKDIR' and 'DEPLOY_DIR'. What these variables have in common is
> >> that they are set in bitbake.conf using '?=' or '??='.
> >> 
> >> In addition, we check to avoid any setting that might lead to host path
> >> bleeding into SDK's configuration.
> >> 
> >> [YOCTO #7616]
> >> 
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >> 
> >>   meta/classes/populate_sdk_ext.bbclass | 23 +++++++++++++++++++++++
> >>   1 file changed, 23 insertions(+)
> >> 
> >> diff --git a/meta/classes/populate_sdk_ext.bbclass
> >> b/meta/classes/populate_sdk_ext.bbclass index 2fc4c11..49ba26b 100644
> >> --- a/meta/classes/populate_sdk_ext.bbclass
> >> +++ b/meta/classes/populate_sdk_ext.bbclass
> >> @@ -16,6 +16,7 @@ SDK_RDEPENDS_append_task-populate-sdk-ext = "
> >> ${SDK_TARGETS}" SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
> >> 
> >>   SDK_META_CONF_WHITELIST ?= "MACHINE DISTRO PACKAGE_CLASSES"
> >> 
> >> +SDK_META_CONF_BLACKLIST ?= "TMPDIR DL_DIR SSTATE_DIR STAMPS_DIR
> >> BASE_WORKDIR DEPLOY_DIR"
> >> 
> >>   SDK_TARGETS ?= "${PN}"
> >>   OE_INIT_ENV_SCRIPT ?= "oe-init-build-env"
> >> 
> >> @@ -114,6 +115,28 @@ python copy_buildsystem () {
> >> 
> >>           f.write('# this configuration provides, it is strongly
> >>           suggested
> >> 
> >> that you set\n') f.write('# up a proper instance of the full build system
> >> and use that instead.\n\n')
> >> 
> >> +        # Copy configurations from the current local.conf
> >> +        builddir = d.getVar('TOPDIR', True)
> >> +        with open(builddir + '/conf/local.conf', 'r') as lf:
> >> +            varblacklist = d.getVar('SDK_META_CONF_BLACKLIST',
> >> True).split() +            skip = False
> >> +            for line in lf:
> >> +                line = line.lstrip()
> >> +                if line.startswith('#'):
> >> +                    continue
> >> +                # avoid host path bleeding into SDK configuration
> >> +                if line.find('"/') != -1:
> >> +                    continue
> >> +                for varname in varblacklist:
> >> +                    if line.startswith(varname):
> >> +                        skip = True
> >> +                        break
> >> +                if not skip:
> >> +                    f.write(line)
> >> +                skip = False
> >> +        f.write('\n')
> >> +
> >> +        # Configurations in local.conf which are specific for extensible
> >> SDK f.write('INHERIT += "%s"\n\n' % 'uninative')
> >> 
> >>           f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION'))
> > 
> > I've been thinking about this; since I've recently added edit_metadata()
> > in
> > bitbake's lib/bb/utils.py, it would make sense to use that rather than
> > adding another piece of code that effectively parses bitbake
> > configuration files (though I know this isn't adding much). I know this
> > series has been going back and forth for a while now and the delays have
> > largely been my fault, so I'd be happy to make this change and resend the
> > series - it's up to you.
> > 
> > Cheers,
> > Paul
> 
> Hi Paul,
> 
> Thanks for your suggestion.
> I've been looking into edit_metadata(). But it seems that it's used to
> modify *specific* variables.
> In this case, we don't know which variables we are going to skip in
> local.conf. We just know that they start with '/'. So I don't see how to
> do it.

Well, what you pass in actually goes into a regex, so you can just match
any variable with it - you just need to take care that it doesn't match
characters it shouldn't. Here's an example I just tested - you can place
it in scripts/ in order to try it out:

------------- snip ------------
import sys
import os

scripts_path = os.path.dirname(os.path.realpath(__file__))
lib_path = scripts_path + '/lib'
sys.path = sys.path + [lib_path]

import scriptpath
bitbakepath = scriptpath.add_bitbake_lib_path()

import bb.utils

whitelist = ['BBMASK']
def handle_var(varname, origvalue, op, newlines):
    print '%s "%s"' % (varname, origvalue)
    if '/' in origvalue and (not ':/' in value or varname in whitelist):
        newlines.append('# Removed original setting of %s\n' % varname)
        return None, op, 0, True
    else:
        return origvalue, op, 0, True

varlist = ['[^#=+ ]*']
with open('conf/local.conf', 'r') as f:
    oldlines = f.readlines()
(updated, newlines) = bb.utils.edit_metadata(oldlines, varlist, handle_var)

with open('conf/local.conf.newedit', 'w') as f:
    for line in newlines:
        f.write(line)

------------- snip ------------

We really ought not to have to care about matching #, that's probably
a bug in edit_metadata().  While looking at my own local.conf I noticed that
BBMASK might have / in it and we'd probably want to allow it through; I
don't know if there are other reasonable examples. I suspect we ought
to have a variable for this to allow for some flexibility. As in the example
we probably also want to default to allowing variable values that contain
URLs as well.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

