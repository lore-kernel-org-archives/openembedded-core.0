Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMbvl-0000Uk-Kd
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:16:33 +0200
Received: by pwj9 with SMTP id 9so672928pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 01:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=GzvpF06z/nxyXRn3xKZunJbUmRRT1SIT2HcKko47jwo=;
	b=ct3WRhV+Xb9gjnP0BGIUoxXJR9q1EWQ4ZsVtGCRBQcZjfl19RnkZ3hgJVyN0nLgJ7s
	hISYxSV5ryTGKJSsBh/A4xs/dkjRoFODSrI00e7sphkosgys0j9giBIyvCxuykiQiUjx
	gzeYfZp1suPkfpsNEk1EuCbbr0qmEElMk5XWw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=j0lZ3j0/qhs/G+M7cZj+W+Iy2UIV7D6+jZTuLI/uOleCbz6Eakwa0EO3MR2Z9kbJlR
	ODb1K8/avZHvTcuTOgP02JakzjDIK2CC5md0ID9qqFnwu/R8+pjtKRyk1MzXZ/eyQVeP
	eiS21NK7lXjFUWHUNhks9Y7NF/qT73XSdlz0c=
Received: by 10.68.60.135 with SMTP id h7mr2406789pbr.457.1305706418592;
	Wed, 18 May 2011 01:13:38 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id a20sm907610pbu.59.2011.05.18.01.13.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 01:13:36 -0700 (PDT)
Date: Wed, 18 May 2011 01:12:34 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20110518081234.GB31650@sakrah.homelinux.org>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
	<20110518074909.GA31650@sakrah.homelinux.org>
	<1305705436.3424.299.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1305705436.3424.299.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
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
X-List-Received-Date: Wed, 18 May 2011 08:16:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/05/11 08:57), Richard Purdie wrote:
> On Wed, 2011-05-18 at 00:49 -0700, Khem Raj wrote:
> > I think we need to globalize libc variable like MACHINE or MULTIMACHINE
> > and we could check if PREFERRED_PROVIDER_virtual/libc == TCLIBC or not
> > in base.bbclass for sanity. Something like attached patch might be
> > able to do it
> 
> Having assessed how many places in the system we'd need to make this
> kind of change I'm now of the opinion its too great. I think
> manipulating TMPDIR is a better cleaner solution and we should inject
> this there...

hmmm ok. So we delete these definitions from tclibc-uclibc.inc

DEPLOY_DIR_IMAGE = "${TMPDIR}/deploy/images"
DEPLOY_DIR_append = "-uclibc"
STAGING_DIR_TARGET_append = "-uclibc"
STAGING_DIR_HOST_append = "-uclibc"
SSTATE_MANIFESTS_append = "-uclibc"

and append define
TMPDIR ?= "${TOPDIR}/tmp-${TCLIBC}"

should be enough
> 
> Cheers,
> 
> Richard
> 

-- 
-Khem


