Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UFoDZ-0006CV-GB
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 17:08:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2DFp9Yi020262
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Mar 2013 08:51:10 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 13 Mar 2013 08:51:09 -0700
Message-ID: <5140A06B.8090904@windriver.com>
Date: Wed, 13 Mar 2013 10:51:07 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130313133524.GH3260@jama>
In-Reply-To: <20130313133524.GH3260@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: update-alternatives automatic rename happens too late
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 16:08:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/13 8:35 AM, Martin Jansa wrote:
> When using update-alternatives feature to rename targets to
> target.${BPN} it happens in perform_packagecopy, but for recipes where
> that target is also staged to sysroot it's too late, both recipes will
> try to install the same target file to sysroot.
>
> One way to resolve this is to rename target to target.${BPN} directly in
> recipe's do_install, but can we move this automatic renaming to
> do_install? More importantly do we have some examples where we need to
> run u-a for files in sysroot (e.g. when unpacking archive from
> sstate-cache)?
>

It was specifically NOT done via a do_install(_append) because other things 
could have been appending and doing odd behaviors that may or may not be supported.

Also as far as the sysroot went, all of the files that collided were 
executables, man pages, etc... (not libraries or headers!)  so they generally 
are not used during the compilation process, but I can see with the additional 
sysroot checking that this can add problems.

Perhaps the right fix is to add an additional task before the do_package (where 
the sysroot is setup) but after the do_install that is specific to the 
update-alternatives configuration?  Change from doing it in the ${D} directory 
as well...

--Mark


