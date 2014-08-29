Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6663F70EF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:40:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7TIeCZ9023325
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 11:40:12 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 11:40:12 -0700
Message-ID: <5400C90B.4070100@windriver.com>
Date: Fri, 29 Aug 2014 13:40:11 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1409334040.29296.197.camel@ted>
In-Reply-To: <1409334040.29296.197.camel@ted>
Subject: Re: [PATCH] package_rpm: Add builddir macro to define source directory
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
X-List-Received-Date: Fri, 29 Aug 2014 18:40:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/14, 12:40 PM, Richard Purdie wrote:
> This allows its usage in other RPM macros so files in ${S} can be found.

Minor note, (traditional) RPM doesn't differentiate between the 'B' and the 'S'. 
  So build dir has historically be a combination of the two.

In this case, 'S' is likely better, because any additional post-processing is 
going to want to reference the generated objects and not the original source. 
(If the post processing needs the source, then globally S and B will need to be 
merged back together in a distribution specific configuration.)

So long story short, no objections.. just wanted to cover why S vs B makes sense 
here.

--Mark

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 0f565ac..51910ec 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -689,6 +689,7 @@ python do_package_rpm () {
>       cmd = rpmbuild
>       cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
>       cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
> +    cmd = cmd + " --define '_builddir " + d.getVar('S', True) + "'"
>       cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
>       cmd = cmd + " --define '_use_internal_dependency_generator 0'"
>       if perfiledeps:
>
>


