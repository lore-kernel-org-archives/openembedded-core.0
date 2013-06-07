Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66B1061EEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 15:06:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r57F64xq018516
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 08:06:04 -0700 (PDT)
Received: from msp-dhcp18.wrs.com (172.25.34.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 7 Jun 2013 08:06:03 -0700
Message-ID: <51B1F6E1.8050901@windriver.com>
Date: Fri, 7 Jun 2013 10:06:09 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1370602058.6864.24.camel@ted>
In-Reply-To: <1370602058.6864.24.camel@ted>
Subject: Re: OE-Core and Bitbake wrapper changes (min 2.7.3 python version)
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
X-List-Received-Date: Fri, 07 Jun 2013 15:06:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/13 5:47 AM, Richard Purdie wrote:
> Its not secret that I hate the current bitbake wrapper script and want
> to remove it for 101 different reasons.
>
> I now have code which removes the need for the double execution of
> bitbake which was the only fundamental reason we had it. The question
> therefore remains, what to do with the other pieces of the wrapper,
> specifically the tar and git versions checks.
>
> As a reminder for those who don't remember the problem here, the git
> version is checked since we use certain parameters in the git fetcher
> which need certain versions of git and git is in ASSUME_PROVIDED these
> days. Its possible to trigger git operations at part time to resolve
> revisions. tar is even more ugly since the wrong version has issues
> extracting sstate archives. These issues mean injecting building them
> into the dependency chain at the right point is hard.
>
> Personally, I think we carry around a bit too much legacy these days and
> its starting to hurt us. I would therefore like to propose that we take
> this opportunity to do some spring cleaning and simply error on:
>
> * broken tar versions
> * too old versions of git
> * python < 2.7.3
>
> The python version check would move to the oe-init-build-env script, the
> git/tar versions to sanity.bbclass.

Can we also add the python check to bitbake as well?  My concern is not everyone 
uses the oe-init-build-env script, so ensuring that bitbake stops immediately 
and tells the user what's wrong is important.

> The recommendation for anyone with these older versions would be to
> install our standalone tools tarball which would have python 2.7.3 and
> working versions of tar/git.
>
> The reason for the python version change is so we can embrace the
> unittest improvements in 2.7 and drop all of the workarounds for pre
> 2.7.3 bugs in bitbake. This starts to move us towards python 3, if this
> tarball works well, we'd use the same approach to move to python 3.
>
> Any objections?

No objection, this seems fine.  It would be nice if there was a simple way (for 
the tar and git cases) to be able to build them as a user step and then be able 
to use them, but that "nice experience" can easily be handled by documentation 
as well.

--Mark

> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


