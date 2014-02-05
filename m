Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B4C0C6E2D8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 22:13:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 05 Feb 2014 14:13:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,789,1384329600"; d="scan'208";a="470504743"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.183])
	by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2014 14:13:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 05 Feb 2014 22:13:18 +0000
Message-ID: <5155905.zpccSNMN1P@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.12.9-301.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <52F29080.9080200@linux.intel.com>
References: <1390685105-16717-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAMKF1sqEhyFP8VRTf1m_p3SdURHFeNswT_GtrE8aj6Pqwak2xQ@mail.gmail.com>
	<52F29080.9080200@linux.intel.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/buildhistory: fix expansion of escape sequences
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
X-List-Received-Date: Wed, 05 Feb 2014 22:13:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 05 February 2014 11:26:56 Saul Wold wrote:
> There still might be an issue:
> > ERROR: Error executing a python function in
> > /srv/hdd/poky/meta/recipes-support/ca-certificates/ca-certificates_201306
> > 10.bb:
> > 
> > The stack trace of python calls that resulted in this exception/failure
> > was: File: 'buildhistory_emit_pkghistory', lineno: 220, function:
> > <module>> 
> >      0216:
> >      0217:        write_pkghistory(pkginfo, d)
> >      0218:
> >  
> >      0219:
> >  *** 0220:buildhistory_emit_pkghistory(d)
> >  
> >      0221:
> > File: 'buildhistory_emit_pkghistory', lineno: 217, function:
> > buildhistory_emit_pkghistory> 
> >      0213:        pkginfo.filelist = " ".join(filelist)
> >      0214:
> >      0215:        pkginfo.size = int(pkgdata['PKGSIZE'])
> >  
> >      0216:
> >  *** 0217:        write_pkghistory(pkginfo, d)
> >  
> >      0218:
> >      0219:
> >      0220:buildhistory_emit_pkghistory(d)
> > 
> >      0221:
> > File: 'buildhistory.bbclass', lineno: 38, function: write_pkghistory
> > 
> >      0034:        if pkginfo.rconflicts:
> >      0035:            f.write("RCONFLICTS = %s\n" %  pkginfo.rconflicts)
> >      0036:        f.write("PKGSIZE = %d\n" %  pkginfo.size)
> >      0037:        f.write("FILES = %s\n" %  pkginfo.files)
> >  
> >  *** 0038:        f.write("FILELIST = %s\n" %  pkginfo.filelist)
> >  
> >      0039:
> >      0040:    for filevar in pkginfo.filevars:
> >      0041:        filevarpath = os.path.join(pkgpath, "latest.%s" %
> >      filevar)
> >      0042:        val = pkginfo.filevars[filevar]
> > 
> > Exception: UnicodeEncodeError: 'ascii' codec can't encode character
> > u'\xed' in position 337: ordinal not in range(128)
>
> I tried to delete the buildhistory for ca-certs and rebuild without any
> sstate, but it still failed to build. correctly.

I've now reproduced this, working on a fix.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

