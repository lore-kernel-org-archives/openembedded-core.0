Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB8173243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 22:14:48 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 3A7C9F811FE; Tue, 22 Sep 2015 16:14:47 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id A9395F8119A;
	Tue, 22 Sep 2015 16:14:46 -0600 (MDT)
To: openembedded-core@lists.openembedded.org
References: <1442943875-2955-1-git-send-email-marcus.mueller@ettus.com>
	<CALg11mgdLnVNq745Z6vzP5R2t=dcpamHTKkg5ptv5+NXWFxXpQ@mail.gmail.com>
	<5601A1C6.5050205@ettus.com>
	<CALg11mhL1YMX_1aW8FUQoT5qJEgESe3SSQvk+40gukiA2Ffidg@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5601D2E4.50503@mlbassoc.com>
Date: Tue, 22 Sep 2015 16:15:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CALg11mhL1YMX_1aW8FUQoT5qJEgESe3SSQvk+40gukiA2Ffidg@mail.gmail.com>
Subject: Re: [PATCH] hand the TEMPLATECONF local over to setup-builddir
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
X-List-Received-Date: Tue, 22 Sep 2015 22:14:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 2015-09-22 14:25, Lee Nipper wrote:
> On Tue, Sep 22, 2015 at 1:45 PM, Marcus Müller <marcus.mueller@ettus.com <mailto:marcus.mueller@ettus.com>> wrote:
>
>     Hello,
>     > If I understand correctly it allows a user prepared $TEMPLATECONF
>     > directory
>     > to be used by oe-setup-builddir.
>     Indeed; the point is that oe-setup-builddir was definitely meant to be
>     used with a TEMPLATECONF set by the user; in bash, the TEMPLATECONF
>     local variable is automatically passed on from oe-init-build-env to
>     oe-setup-builddir¹, but in zsh, this doesn't work without explicitely
>     declaring that should happen (which is the only thing my patch does).
>
>     Best regards,
>     Marcus
>
>     ¹ not quite sure how; it's a local to the calling script and shouldn't
>     be a local or env variable to the callee, IMHO.
>
>
>
> Hello Marcus,
>
> FWIW, I did some test cases to understand the differences.
>
> With bash 4.3.11, and the examples below,
> cases A and B will pass along TEMPLATECONF, but case C does not.
> Your patch makes case C work as well.
>
> # A:
>
> TEMPLATECONF=$HOME/my-template-dir source ~/openembedded-core/oe-init-build-env $HOME/my-build-dir
>
> # B:
> export TEMPLATECONF=$HOME/my-template-dir; source ~/openembedded-core/oe-init-build-env $HOME/my-build-dir
>
> # C:
> TEMPLATECONF=$HOME/my-template-dir; source ~/openembedded-core/oe-init-build-env $HOME/my-build-dir
>
>
> And with zsh 5.0.2, case B will pass along TEMPLATECONF, but cases A and C do not.
> Your patch makes cases A and C work as well with zsh.
>
> I did not expect case A to be different than case C for bash, but it apparently works differently than I thought.

This is indeed expected behaviour - environment variables defined
on the command line before the command itself are local to that
command's execution only.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

