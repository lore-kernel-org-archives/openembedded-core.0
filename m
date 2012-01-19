Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Rnuco-0000UF-9D
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 17:14:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0JG6Pv7018754
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 08:06:25 -0800 (PST)
Received: from Macintosh-5.local (172.25.34.36) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 19 Jan 2012 08:06:25 -0800
Message-ID: <4F183F80.8060508@windriver.com>
Date: Thu, 19 Jan 2012 10:06:24 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1326978483.2511.68.camel@ted> <3069877.zIVnnZc8iy@helios>
In-Reply-To: <3069877.zIVnnZc8iy@helios>
Subject: Re: Buildhistory in action
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
X-List-Received-Date: Thu, 19 Jan 2012 16:14:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/19/12 9:04 AM, Paul Eggleton wrote:
> On Thursday 19 January 2012 13:08:03 Richard Purdie wrote:
>> If I change into tmp/buildhistory and show the last commit the result is
>> included below. Since the version changed, the diff isn't as readable as
>> would be ideal, however reading through it clearly shows the .a files
>> moving to the staticdev packages with no unintended changes as far as I
>> could tell.
>>
>> One of my big worries with the staticdev changes is any unintended
>> packaging changes. This lets me view the changes more precisely which
>> can only lead to higher quality regression spotting for the project. I'd
>> like to suggest more people start enabling this and using it to check
>> the changes they're making.
>>
>> I know Paul is working on tools to better display these changes too and
>> those will help make these diffs easier to read.
>
> There's the command line buildhistory-diff tool (in scripts/) already, and this
> will query the git repository and report just the changes that might represent
> regressions, in a form that's a bit easier to read than git diff. For example
> (simulated):
>
> paul@helios:~/poky/poky/build/tmp/buildhistory$ ~/poky/poky/scripts/buildhistory-diff . HEAD^^
> Changes to images/qemux86_64/eglibc/core-image-minimal (files-in-image.txt):
>    /etc/anotherpkg.conf was added
>    /sbin/anotherpkg was added
>    * (installed-package-names.txt):
>    *   anotherpkg was added
> Changes to images/qemux86_64/eglibc/core-image-minimal (installed-package-names.txt):
>    anotherpkg was added
> packages/qemux86_64-poky-linux/v86d: PACKAGES: added "v86d-extras"
>    * PR changed from "r0" to "r1"
>    * PV changed from "0.1.10" to "0.1.12"
> packages/qemux86_64-poky-linux/v86d/v86d: PKGSIZE changed from 110579 to 144381 (+30%)
>    * PR changed from "r0" to "r1"
>    * PV changed from "0.1.10" to "0.1.12"
>
> For those that may not be aware I'm also working on a web frontend to
> view/manage these changes more effectively (utilising the same backend code),
> however it still needs quite a bit of work.

Does the build history due any scanning of either package or shared library 
dependencies?

I hit a case recently working on a custom layer, where everything built 
properly, I made a few changes and I happened to notice by accident that it was 
no longer linking to the shared library, but instead the static library.  This 
changed both the package (runtime) dependencies and the shared library usage in 
the problem... the resulting binary suddenly jumped in size as well.

--Mark


