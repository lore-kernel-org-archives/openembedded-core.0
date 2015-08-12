Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBA9475FB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 02:13:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7C2DOq6019095
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Aug 2015 19:13:24 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 11 Aug 2015 19:13:23 -0700
Message-ID: <55CAABC2.50008@windriver.com>
Date: Wed, 12 Aug 2015 10:13:22 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <cover.1438269391.git.liezhi.yang@windriver.com>	<50edd6dd2fa86d9a51cc54ecdaa1599a1efc5a43.1438269391.git.liezhi.yang@windriver.com>
	<CAP9ODKqzs9VF7C6YFcgdu1tPuFq_ftOyS6HQZda9qvv=i23e4w@mail.gmail.com>
In-Reply-To: <CAP9ODKqzs9VF7C6YFcgdu1tPuFq_ftOyS6HQZda9qvv=i23e4w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] base.bbclass/blacklist.bbclass: remove doc item when d.getVarFlags()
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
X-List-Received-Date: Wed, 12 Aug 2015 02:13:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/11/2015 08:45 PM, Otavio Salvador wrote:
> On Thu, Jul 30, 2015 at 12:18 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> The FOO[doc] is set in meta/conf/documentation.conf, we need remove it
>> from d.getVarFlags()'s return dict when it causes many loops.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>
> It seems your commit log is incomplete or so as I couldn't understand
> why this is need.
>
> Also as Andre says, we ought to not break existing layer without a
> very strong reason and if needed, changing documentation.conf instead
> of this seems more adequate.
>

The code in base.bbclass is: (no remove PACKAGECONFIG[doc])

     pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
     if pkgconfigflags:
        <foo>

And documentation.conf:
PACKAGECONFIG[doc] = "This variable provides a means of enabling or disabling 
features of a recipe on a per-recipe basis."

This will make "if pkgconfigflags:" always be true and cause many unneeded
loops since there is always PACKAGECONFIG[doc].

Remove PACKAGECONFIG[doc] or comment it sounds good to me.

// Robert

