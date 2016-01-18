Return-Path: <olof.johansson@axis.com>
X-Greylist: delayed 341 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Jan 2016 12:50:11 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE426FFA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 12:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3675D180A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:44:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 1qzZvhc4JmUn
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:44:29 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 851AF1805A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:44:29 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 6605F1441
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:44:29 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 5A927E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:44:29 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 561843E43B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:44:29 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Mon, 18 Jan 2016
	13:44:28 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id C36169C724; 
	Mon, 18 Jan 2016 13:44:28 +0100 (CET)
Date: Mon, 18 Jan 2016 13:44:28 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20160118124428.GK31212@axis.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: PV from filename, not reflected in siginfo?
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
X-List-Received-Date: Mon, 18 Jan 2016 12:50:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

I'm currently investigating reports of bitbake not correctly
handling a type of change to a recipe, where the only change is a
filename rename to update the PV.

With bitbake-dumpsigs:

 ...
 Variable PV value is ${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}
 Variable PN value is ${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}
 ...

... with nothing containing the resolved value of PV. I would
expect the computed value of PV to be a part of the siginfo. The
consquence of this seems to be that bitbake doesn't schedule
dependents to be rebuilt, i.e. if I rename the recipe
foo_1.2.3.bb to foo_1.2.4.bb, the recipe foo is rebuilt, but the
image isn't.

I tried some changes:

 - Changing the PV assignment in bitbake.conf to :=. Didn't work,
   got errors that I suspect are related to not being able to
   include foo-${PV}.inc files. The value of PV was clobbered.
   Also played around with using BB_FILENAME instead, but didn't
   help.

 - Changes within Bitbake that assigned the version part of the
   filename to PV when loading new files ending with .bb. This
   worked but is really ugly.

 - Moving the PV assignment into the recipe (as an explicit
   assignment). This works, makes dependents build as expected
   and bitbake-dumpsigs lists the value, but is also ugly.

I suspect this isn't usually a problem in OE-Core, since most
recipe updates requires updates within the recipe as well
(tarball checksums, for instance), but that's not as true for our
internal recipes.

Is this a known issue? Any ideas on how to solve this? Nicer
workarounds?


Thanks,
-- 
olofjn

