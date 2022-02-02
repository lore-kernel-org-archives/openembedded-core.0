Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6268C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 02:00:07 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.58497.1643767206619765566
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 18:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=f6mgDyBi;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643767207;
  x=1675303207;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dw8KWihCCsMZ814i8hl+iaGN82NPf+RdkfZXRSvBfP8=;
  b=f6mgDyBiR6azPB2cHRyWNtfiiK02zs7095vQmWvAOpdtQWLLaIvit57S
   tk4NYCvpR+K4eZ0i1Ki1ZkrDwGmac4qkfKGJOVR2/m01XnF+lxBti6KjI
   CuJSunZBDirzfoIBZa9QqJ+69pEyrUZDQ9SoKN9NLJv/14nGX3JpP4Es0
   ZeWMn2+jlo+XVFyNxsygGFNCPPtZls6c9Yv8qtSE7uiQUOIbo2c8Ua/nd
   gi70X/cOvsTjUPz2Ez7RDGBSE7bNVX8aq3eq2/pfuvT5S1Fqda4S0f9+U
   3GibYbodD75FqR6dmUAaoXZ5j9BJV93yayuNM8cacpOmq5m3VjP7iEO5c
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/3] Split split_and_strip_files()
Date: Wed, 2 Feb 2022 02:59:47 +0100
Message-ID: <cover.1643766962.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 02:00:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161174

This is my third attempt to make it possible for me to hook into the
split_and_strip_files() function. We need this to be able to rename
the debug files for some packages to avoid conflicts when installing
them.

In this version, the first patch splits out the part of
split_and_strip_files() that is responsible for setting up the
variables used to implement the various debug splitting methods
specified by PACKAGE_DEBUG_SPLIT_STYLE into a new function,
package_debug_vars(). This I believe to be a good thing in itself as
that function is way too long anyway.

The second and third patch are not needed to allow me to hook into the
split_and_strip_files() function, but they simplify the APIs used for
passing the variables returned by package_debug_vars() around.

With these patches in place, I can now wrap the package_debug_vars()
function with the following local wrapper package.bbclass:

require ${COREBASE}/meta/classes/package.bbclass

PACKAGE_DEBUG_FILE_SUFFIX ??= ""

# Provide the original package_debug_vars() as org_package_debug_vars().
org_package_debug_vars := "${@d.getVar('package_debug_vars', False).replace('package_debug_vars', 'org_package_debug_vars')}"
python () {
    bb.methodpool.insert_method("", d.getVar("org_package_debug_vars", False), "<code>", 0)
}

# This version of package_debug_vars() wraps the original package_debug_vars()
# by calling org_package_debug_vars() and then appends PACKAGE_DEBUG_FILE_SUFFIX
# to dv["append"] and dv["staticappend"].
def package_debug_vars(d):
    dv = org_package_debug_vars(d)

    dv["append"] += d.getVar('PACKAGE_DEBUG_FILE_SUFFIX')
    dv["staticappend"] += d.getVar('PACKAGE_DEBUG_FILE_SUFFIX')

    return dv

The definition of the org_package_debug_vars() function is not very
pretty, but it seems to work, and this solution means a heck of a lot
less maintenance than to try to maintain a backported version of the
over 250 lines long split_and_strip_files() function (as it was before
my changes).

//Peter

The following changes since commit 74a8a74a553a33dc5f41939f8070d75e6d57d3da:

  busybox: Add shell arithmetic to work with poky-tiny (2022-02-01 07:32:08 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/package_debug_vars
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/package_debug_vars

Peter Kjellerstedt (3):
  package.bbclass: Split out package_debug_vars from
    split_and_strip_files
  package.bbclass: Make package_debug_vars() return a dict
  package.bbclass: Pass dv (debug_vars) around instead of individual
    vars

 meta/classes/package.bbclass | 127 +++++++++++++++++++----------------
 1 file changed, 70 insertions(+), 57 deletions(-)


