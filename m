Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 300D76FF84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 10:31:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9BAVfLP007153
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 11 Oct 2016 03:31:41 -0700
Received: from soho-mhatle-m.local (147.11.116.80) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Oct 2016 03:31:40 -0700
To: Gary Thomas <gary@mlbassoc.com>, <openembedded-core@lists.openembedded.org>
References: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
	<39a3791d-d74a-21de-5806-edda4c26b33f@windriver.com>
	<lyd1j7s0j0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<47d07770-136d-57f8-63b8-1abe95f5293e@mlbassoc.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <10e74601-38f7-3e65-246e-ffdc399821bb@windriver.com>
Date: Tue, 11 Oct 2016 12:31:39 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <47d07770-136d-57f8-63b8-1abe95f5293e@mlbassoc.com>
Subject: Re: [PATCH] glibc: Fix timestamp of plural.c after unpack
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
X-List-Received-Date: Tue, 11 Oct 2016 10:31:41 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/11/16 11:46 AM, Gary Thomas wrote:
> On 2016-10-11 11:22, Enrico Scholz wrote:
>> Mark Hatle <mark.hatle-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:
>>
>>> My understanding of the issue is that the extraction of the plural.c and
>>> plural.y files happens so quickly that it is unclear to make if one is older
>>> then the other -- so it sometimes uses bison to rebuild the plural.c.
>>
>> When this is really the case, this can apply to the workaround too.  So,
>> there should be added a 'sleep 1' before the 'touch' or (better?) remove
>> plural.c to enforce a rebuild.
> 
> I believe that's the opposite of the desired action, i.e. to always use
> the packaged plural.c and never rely on the plural.y=>plural.c transformation.
> 
>>
>>>> +do_unpack_workaround() {
>>>> +	touch ${S}/intl/plural.c
>>>> +}
> 

Correct.  We want to use the included version from glibc, -unless- there is a
patch that has modified the plural.y.

So doing this as an intermediate operation between unpack and patch should
correct the timestamp issue, while still allowing a patch to modify plural.y to
trigger an automatic regeneration (and any advantages or problems introduced by
the regeneration operation.)

As for the sleep 1, we've generally seen that is a long enough delay in tasks
that that is not necessary.  Most filesystems seem to have sub second accuracy.
However, if it does become an issue, I agree the sleep 1 is likely the only
solution to ensure the stamp has changed sufficiently..

--Mark

