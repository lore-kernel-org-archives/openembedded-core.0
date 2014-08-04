Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C7F5E65C68
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 14:49:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Aug 2014 07:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,798,1400050800"; d="scan'208";a="579772111"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.206])
	by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2014 07:49:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: sujith h <sujith.h@gmail.com>
Date: Mon, 04 Aug 2014 15:49:15 +0100
Message-ID: <4994345.PFS2CvPxzl@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CADyYWLnK2m93BsT+XvPTg-eAFeKTqYUhSLTNkSHEtF8=EemaNw@mail.gmail.com>
References: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
	<1418636.H30RBdXEMU@peggleto-mobl5.ger.corp.intel.com>
	<CADyYWLnK2m93BsT+XvPTg-eAFeKTqYUhSLTNkSHEtF8=EemaNw@mail.gmail.com>
MIME-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Sujith H <Sujith_Haridasan@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Mon, 04 Aug 2014 14:49:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 04 August 2014 20:03:09 sujith h wrote:
> Hi Paul,
> 
> 
> On Mon, Aug 4, 2014 at 7:48 PM, Paul Eggleton <paul.eggleton@linux.intel.com
> > wrote:
> > 
> > Hi Sujith,
> > 
> > On Monday 04 August 2014 19:27:08 Sujith H wrote:
> > > From: Sujith H <Sujith_Haridasan@mentor.com>
> > > 
> > > If hostname is not added to /etc/hosts file then rpcinfo
> > > command fails when hostname is passed as argument. This was
> > > observed when rpcinfo command was tested on freescale target.
> > > Below was the output observed without this change.
> > > 
> > > root@mx6q:~# rpcinfo -s mx6q
> > > rpcinfo: can't contact rpcbind: RPC: (unknown error code)
> > > 
> > > Below is the output after this change:
> > > root@mx6q:~# rpcinfo -s mx6q
> > > 
> > >    program version(s) netid(s)                         service     owner
> > >    
> > >     100000  2,3,4     local,udp,tcp,udp6,tcp6          portmapper
> >  
> >  superuser
> >  
> > > root@mx6q:~#
> > > 
> > > Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> > > ---
> > > 
> > >  meta/classes/image.bbclass | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > > index 82605f2..7a5a5c1 100644
> > > --- a/meta/classes/image.bbclass
> > > +++ b/meta/classes/image.bbclass
> > > @@ -341,6 +341,14 @@ ssh_disable_dns_lookup () {
> > > 
> > >       fi
> > >  
> > >  }
> > > 
> > > +ROOTFS_POSTPROCESS_COMMAND += "add_machine_name_loop_back;"
> > > +
> > > +add_machine_name_loop_back() {
> > > +    if [ -n ${MACHINE} ]; then
> > > +         echo 127.0.1.1 "       "${MACHINE} >>
> > > ${IMAGE_ROOTFS}${sysconfdir}/hosts +    fi
> > > +}
> > > +
> > 
> > I think in the earlier discussion the conclusion was that we do not want
> > this
> > enabled by default, which the above will do.
> > 
> > The question I have is, if this isn't a good idea, is there a better
> > solution?
> 
> I totally agree with the discussion. Is it a good idea to implement like
> check made for zap_empty_root_password?
> For zap_empty_root_password there is a conditional check if debug-tweaks
> are enabled then zap_empty_root_password is
> called. So can I use debug-tweaks to handle add_machine_name_loop_back in
> the patch?

No, that would not be right - debug-tweaks is for a specific purpose which is 
unrelated to this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

