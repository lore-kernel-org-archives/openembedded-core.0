Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QwmfK-0007id-4G
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 05:01:06 +0200
Received: by gxk3 with SMTP id 3so2289749gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=w2mmCTkUNXseq3KNv2e1Vz+U+RoMOyMwZuFKfHRHq7Q=;
	b=nXkUaiXOg5YlH8ILwCQ60tI/DD0MqcdiOn6EtDZwknkcQjEZtwlX5Bqcv6S3NRdq1w
	DKZ7E5ILF3ekacaKizFIE0vzEgG/yntrPOPyKv2T1x9DI53dNC/XuVOO7U9TtzInZvCX
	7Yzk8kHuYWb517hwE3381AolWDaEGyrCyM9F4=
MIME-Version: 1.0
Received: by 10.236.80.9 with SMTP id j9mr3075856yhe.94.1314327377569; Thu, 25
	Aug 2011 19:56:17 -0700 (PDT)
Received: by 10.236.106.100 with HTTP; Thu, 25 Aug 2011 19:56:17 -0700 (PDT)
Date: Thu, 25 Aug 2011 22:56:17 -0400
Message-ID: <CAOd_LFxZDULXe0bsiGk5NsH+YoGFddvvhFg7OgNKx_MRLj_RfQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: how to use AUTOREV for a SVN repo in oe-core?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Aug 2011 03:01:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I'm trying to figure out how AUTOREV is supposed to work these days
with oe-core.  In the past, I would do something like:

SRCREV = "${AUTOREV}"
PV = "1.0+svnr${SRCREV}"

in my custom application recipes to always build the head of a SVN repo.

In OE classic, we have:

SRCPV = "${@bb.fetch.get_srcrev(d)}"
AUTOREV = "${SRCPV}"

In oe-core, we have:

AUTOREV = "${@bb.fetch2.get_autorev(d)}"
SRCPV = "${@bb.fetch2.get_srcrev(d)}"

in bitbake, we have:

def get_autorev(d):
    #  only not cache src rev in autorev case
    if bb.data.getVar('BB_SRCREV_POLICY', d, True) != "cache":
        bb.data.setVar('__BB_DONT_CACHE', '1', d)
    return "AUTOINC"

def get_srcrev(d):
    """
    Return the version string for the current package
    (usually to be used as PV)
    Most packages usually only have one SCM so we just pass on the call.
    In the multi SCM case, we build a value based on SRCREV_FORMAT which must
    have been set.
    """

    scms = []
    fetcher = Fetch( ....

Therefore, I get package names like the following with oe-core:

svs_1.0+svnrAUTOINC-r4_armv5te.ipk

In the OE classic days, AUTOINC would be replaced with the SVN revision.

And if I check in new changes to the SVN project, it does not rebuild.

What is the recommended way to create a recipe that always builds the
tip of source in a SVN repo?

Its interesting there is a change in oe-core from Feb 13 that switched
from fetch to fetch2:

commit a26163b8f5fc682e6ee4d597e5dd487485b180f5
Author: Saul Wold <sgw@linux.intel.com>
Date:   Sun Feb 13 23:57:59 2011 -0800

    bitbake.conf: change revision fetching to use newer fetch2 code

    Signed-off-by: Saul Wold <sgw@linux.intel.com>

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index da50fe5..162c792 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -560,8 +560,8 @@ UPDATECOMMAND_cvs = "/usr/bin/env cvs -d${CVSROOT}
update -d -P ${CVSCOOPTS}"
 UPDATECOMMAND_svn = "/usr/bin/env svn update ${SVNCOOPTS}"
 SRCDATE = "${DATE}"
 SRCREV = "INVALID"
-AUTOREV = "${@bb.fetch.get_autorev(d)}"
-SRCPV = "${@bb.fetch.get_srcrev(d)}"
+AUTOREV = "${@bb.fetch2.get_autorev(d)}"
+SRCPV = "${@bb.fetch2.get_srcrev(d)}"

 SRC_URI = "file://${FILE}"

and the corresponding functions in fetch are:

def get_autorev(d):
    return get_srcrev(d)

def get_srcrev(d):
   ....

So, before the above change, I would expect the OE classic behavior in oe-core.

Thanks,
Cliff



-- 
=================
http://bec-systems.com


