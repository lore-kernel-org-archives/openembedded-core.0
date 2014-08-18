Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0C82F610F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 10:54:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Aug 2014 03:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,885,1400050800"; d="scan'208";a="589603199"
Received: from sdoherty-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.63])
	by orsmga002.jf.intel.com with ESMTP; 18 Aug 2014 03:54:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Aug 2014 11:54:28 +0100
Message-ID: <2504829.VI0TcbR3XB@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-200.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <20140816182109.GC3660@jama>
References: <1406294138-31362-1-git-send-email-Martin.Jansa@gmail.com>
	<20140816182109.GC3660@jama>
MIME-Version: 1.0
Subject: Re: [PATCH] buildhistory: rename build-id to build-id.txt and add more info
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
X-List-Received-Date: Mon, 18 Aug 2014 10:54:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 16 August 2014 20:21:09 Martin Jansa wrote:
> On Fri, Jul 25, 2014 at 03:15:38PM +0200, Martin Jansa wrote:
> > * use .txt extension like other reports (e.g. image-info.txt) it's
> > 
> >   also useful when looking at the file from web server which doesn't
> >   have text/plain as default content-type
> > 
> > * include whole BUILDCFG_HEADER/BUILDCFG_FUNCS instead of just layer
> > 
> >   info
> > 
> > * this makes it easier for distro to include more fields without the
> > 
> >   need to modify buildhistory.bbclass
> > 
> > * currently it adds following fields:
> >   Build Configuration:
> >   BB_VERSION        = "1.23.1"
> >   BUILD_SYS         = "x86_64-linux"
> >   NATIVELSBSTRING   = "Gentoo-2.2"
> >   TARGET_SYS        = "x86_64-oe-linux"
> >   MACHINE           = "qemux86-64"
> >   DISTRO            = "shr"
> >   DISTRO_VERSION    = "2013.07-next-20140725"
> >   TUNE_FEATURES     = "m64 core2"
> >   TARGET_FPU        = ""
> 
> ping
> 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > 
> >  meta/classes/buildhistory.bbclass | 26 ++++++++++++++++++--------
> >  1 file changed, 18 insertions(+), 8 deletions(-)
> > 
> > diff --git a/meta/classes/buildhistory.bbclass
> > b/meta/classes/buildhistory.bbclass index 20382ce..479e460 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -461,10 +461,10 @@ END
> > 
> >  	echo "IMAGESIZE = $imagesize" >>
> >  	${BUILDHISTORY_DIR_IMAGE}/image-info.txt
> >  	
> >  	# Add some configuration information
> > 
> > -	echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO}
> > ${DISTRO_VERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id +	echo
> > "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO}
> > ${DISTRO_VERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id.txt
> > 
> > -	cat >> ${BUILDHISTORY_DIR_IMAGE}/build-id <<END
> > -${@buildhistory_get_layers(d)}
> > +	cat >> ${BUILDHISTORY_DIR_IMAGE}/build-id.txt <<END
> > +${@buildhistory_get_build_id(d)}
> > 
> >  END
> >  }
> > 
> > @@ -498,11 +498,21 @@ POPULATE_SDK_POST_HOST_COMMAND_append = "
> > buildhistory_list_installed_sdk_host ;> 
> >  SDK_POSTPROCESS_COMMAND += "buildhistory_get_sdkinfo ; "
> > 
> > -def buildhistory_get_layers(d):
> > -    if d.getVar('BB_WORKERCONTEXT', True) != '1':
> > -        return ""
> > -    layertext = "Configured metadata layers:\n%s\n" %
> > '\n'.join(get_layers_branch_rev(d)) -    return layertext
> > +def buildhistory_get_build_id(d):
> > +    localdata = bb.data.createCopy(d)
> > +    bb.data.update_data(localdata)
> > +    statuslines = []
> > +    for func in oe.data.typed_value('BUILDCFG_FUNCS', localdata):
> > +        g = globals()
> > +        if func not in g:
> > +            bb.warn("Build configuration function '%s' does not exist" %
> > func) +        else:
> > +            flines = g[func](localdata)
> > +            if flines:
> > +                statuslines.extend(flines)
> > +
> > +    statusheader = d.getVar('BUILDCFG_HEADER', True)
> > +    return('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
> > 
> >  def buildhistory_get_metadata_revs(d):
> >      # We want an easily machine-readable format here, so
> >      get_layers_branch_rev isn't quite what we want

Sorry I looked at this earlier and it looked OK to me then, I should have 
acked it already.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

