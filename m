Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 94D18607A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 13:48:58 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 26 May 2017 06:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,397,1491289200"; d="scan'208";a="91742305"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga004.jf.intel.com with ESMTP; 26 May 2017 06:48:58 -0700
Message-ID: <1495807047.26945.19.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Erik =?ISO-8859-1?Q?Bot=F6?= <erik.boto@pelagicore.com>
Date: Fri, 26 May 2017 08:57:27 -0500
In-Reply-To: <b41949aa-b992-6403-4b27-c54d22c15279@pelagicore.com>
References: <20170519142004.32682-1-erik.boto@pelagicore.com>
	<b41949aa-b992-6403-4b27-c54d22c15279@pelagicore.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "Cetola, Stephano" <stephano.cetola@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] masterimage.py: fix issue with calling reboot on masterimage/DUT
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
X-List-Received-Date: Fri, 26 May 2017 13:48:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-05-26 at 11:01 +0200, Erik Botö wrote:
> I guess an introduction should have been added to this patchset, so here 
> it comes a bit late:
> 

no problem, in that case, you may need to tag the commit(s) with the
bugzilla ID


> These patches are what I needed to do in order to get automated runtime 
> tests on target using the systemd-boot target working. There is an open 
> bug in the bugzilla for this as well: 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=11524.
> 
> Cheers,
> Erik
> 
> 
> On 05/19/2017 04:20 PM, Erik Botö wrote:
> > On systemd systems calling reboot over an ssh connection doesn't
> > return as expected causing an exception, therefore wrap the call
> > to reboot in order to avoid this issue.
> >
> > Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
> > ---
> >   meta/lib/oeqa/controllers/masterimage.py | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
> > index 07418fcda1..6cdcfa3068 100644
> > --- a/meta/lib/oeqa/controllers/masterimage.py
> > +++ b/meta/lib/oeqa/controllers/masterimage.py
> > @@ -108,7 +108,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
> >               time.sleep(10)
> >               self.power_ctl("cycle")
> >           else:
> > -            status, output = conn.run("reboot")
> > +            status, output = conn.run("{ sleep 1; reboot; } > /dev/null &")
> >               if status != 0:
> >                   bb.error("Failed rebooting target and no power control command defined. You need to manually reset the device.\n%s" % output)
> >   
> 



