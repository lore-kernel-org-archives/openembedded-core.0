Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D6A36AE9C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 03:22:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5S3MwSk023278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 20:22:58 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 20:22:57 -0700
Message-ID: <51CD0154.9090108@windriver.com>
Date: Fri, 28 Jun 2013 11:21:56 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1371621343.git.liezhi.yang@windriver.com>
	<5bc169404eddb0ec90ce82c6013432f295d0cdc3.1371621343.git.liezhi.yang@windriver.com>
	<lyy5a675lc.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyy5a675lc.fsf@ensc-virt.intern.sigma-chemnitz.de>
Subject: Re: [PATCH 2/3] package_ipk.bbclass: make DESCRIPTION support newline
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
X-List-Received-Date: Fri, 28 Jun 2013 03:22:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Sorry, it's only replied to Enrico, now, reply to the list ...

On 06/19/2013 06:33 PM, Enrico Scholz wrote:
>
>
> Robert Yang <liezhi.yang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
> writes:
>
>> The recipe's DESCRIPTION is wrapped automatically by textwrap, make it
>> support newline ("\n") to let the user can wrap it manually, e.g.:
>>
>> -                    ctrlfile.write('Description: %s\n' % summary)
>> -                    ctrlfile.write('%s\n' % textwrap.fill(description, width=74, initial_indent=' ', subsequent_indent=' '))
>> +                    for t in description.split('\\n'):
>> +                        ctrlfile.write('%s\n' % textwrap.fill(t, width=74, initial_indent=' ', subsequent_indent=' '))
>
> When user wrapped lines manually, why is textwrap.fill() called on the
> lines again?  E.g. when user wrapped manually at 78 columns, this will
> create long - short - long - short lines (in german, why call this
> effect "Kammquoting" (comb quoting)) .
>
> I suggest to avoid textwrap.fill() when text contains '\n'.
>

Because I think that the "\n" is mainly used for splitting paragraph,
so the auto wrap is still useful when there is a "\n", e.g.:

DESCRIPTION = "FOO \n<Too many characters>"

The ouput is:
  FOO
  <74 characters>
  <74 characters>
  [snip]

I think that this is better than:
  FOO
  <Too many characters>

// Robert

>
>
> Enrico
>
>
>

