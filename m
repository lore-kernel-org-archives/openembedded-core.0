Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9E73760097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 10:49:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9MAnKeb028837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 03:49:21 -0700 (PDT)
Received: from marks-mbp.corp.ad.wrs.com (128.224.176.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Wed, 22 Oct 2014 03:49:20 -0700
Message-ID: <54478BAF.7040307@windriver.com>
Date: Wed, 22 Oct 2014 18:49:19 +0800
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1413829859-8489-1-git-send-email-jeffrey.honig@windriver.com>
	<ly7fzteo3p.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <ly7fzteo3p.fsf@ensc-virt.intern.sigma-chemnitz.de>
Subject: Re: [PATCH] Refuse to run bitbake on a kernel that is too old.
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
X-List-Received-Date: Wed, 22 Oct 2014 10:49:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/14, 6:03 PM, Enrico Scholz wrote:
> <jeffrey.honig-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:
>
>> Bitbake.conf now specifies OLDEST_KERNEL to insure that the SDK is
>> not run on a kernel that is not supported by a component of the SDK
>> (i.e. glibc).
>
> OLDEST_KERNEL is used in glibc recipe only; it would be much better
> to build SDK's glibc with an --enable-kernel matching the target
> distribution.  E.g. by setting a special 'OLDEST_KERNEL_nativesdk'
> variable.

glibc included with master has a minimum kernel version due to various ABIs that 
it uses.  My understanding is that the OLDEST_KERNEL does indeed match for the 
nativesdk.

>> +    # Check that our kernel will work for crosssdk
>
> This check should be made overridable for environments which do not
> build SDKs.

Using the buildtools-tarball will result in these issues.. (that is a lot more 
common, at least for us due to the wide variety of distributions that don't have 
minimum tool versions...)

>> +    if os.uname()[0] == "Linux" and LooseVersion(os.uname()[2]) < LooseVersion(d.getVar('OLDEST_KERNEL')):
>
> This check does not work when you build e.g. in an LXC container.  You
> could define something like
>
> | SDK_UNAME ??= "${@' '.join(os.uname())}"
>
> and do the checks on this.
>
>
> Enrico
>


