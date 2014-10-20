Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4903601F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 23:30:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9KNUgdT002675
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 16:30:43 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (128.224.25.173) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 20 Oct 2014 16:30:42 -0700
Message-ID: <54459B21.5010403@windriver.com>
Date: Tue, 21 Oct 2014 07:30:41 +0800
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1413829859-8489-1-git-send-email-jeffrey.honig@windriver.com>
	<CAJTo0LYQpivPS30fDyXV0mB4AGyM7sY=p2a8D+rYsk51JcWUbQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYQpivPS30fDyXV0mB4AGyM7sY=p2a8D+rYsk51JcWUbQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 20 Oct 2014 23:30:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/14, 3:08 AM, Burton, Ross wrote:
> On 20 October 2014 19:30,  <jeffrey.honig@windriver.com> wrote:
>> +    # Check that our kernel will work for crosssdk
>> +    if os.uname()[0] == "Linux" and LooseVersion(os.uname()[2]) < LooseVersion(d.getVar('OLDEST_KERNEL')):
>> +        status.addresult("The system requires a kernel of at least %s to run\n" % d.getVar('OLDEST_KERNEL'))
>> +
>
> The OLDEST_KERNEL documentation says:
>
>                      Declares the oldest version of the Linux kernel that the
>                      produced binaries must support.
>                      This variable is passed into the build of the Embedded
>                      GNU C Library (<filename>eglibc</filename>).
>
> So surely checking this value at *runtime in bitbake* isn't correct.

The generated SDK has the same limitation as the runtime since we moved to 
building the SDK for things like the buildtools-tarball.

While it -might- work on older kernels, I think we do need to limit the version 
we support to match the SDK and related, otherwise we will have issues.  (Do we 
also need to add this to the SDK .sh installer script?  probably.)

--Mark

> Ross
>


