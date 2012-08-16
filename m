Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T26to-0002Pn-9v
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 22:42:36 +0200
Received: by ghbz2 with SMTP id z2so3697009ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 13:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fkxQ3/dfeTAND8Qih5cuaPVsM3wH5XcmYDroK0xJvjU=;
	b=ODe5YTReYBEtplty+MN4w07f6Qxj7sdpOumL8ijhEoG7InpCo3EPn/t25GcsIOK0i2
	lAE9vlbZ7gCpPWDaqotxMHxpjGF5EQ4hTxGcI9bLFNZVgQ2lF8UiR56Fc/RrckXBCzFS
	paPzkAolN0MksMZi3Nlsvi2dOBO55nFfZ3GsppfDqkQ/gA86eGiEwL44Y0TWiRRyrBbx
	sGVcd/5XAFrfh/Qt3UyTum8YR/IzUo5Y1VNnNNdbGUBHz3vO+DQEe2Sndc5VHDBNhTzT
	NEtjHgLHFaa9UTlmL0simgiiWhO4gPPEVOMi+ZwtSUpUG/vLxlLBjfxkUcgppFf58VFw
	qZBQ==
MIME-Version: 1.0
Received: by 10.50.191.165 with SMTP id gz5mr3083699igc.50.1345149037766; Thu,
	16 Aug 2012 13:30:37 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 16 Aug 2012 13:30:37 -0700 (PDT)
In-Reply-To: <1345066801.7750.68.camel@x121e.pbcl.net>
References: <cover.1345047378.git.ross.burton@intel.com>
	<10192d7fd47ea041f73511eaa8b5e56c13152951.1345047378.git.ross.burton@intel.com>
	<20120815211232.GC3108@jama.jama.net>
	<CAJTo0LaKHbXJVAE3Y9jO1wDJYO5iyFAEMYM+U5cgGDhQ6xy+aQ@mail.gmail.com>
	<1345066801.7750.68.camel@x121e.pbcl.net>
Date: Thu, 16 Aug 2012 22:30:37 +0200
Message-ID: <CALbNGRQSzVnbgMZXeS2eWONCWbpdDRL3K7kGAJqj2Jq5dERDJw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] make: add make-replacement-native 3.81
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
X-List-Received-Date: Thu, 16 Aug 2012 20:42:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 15, 2012 at 11:40 PM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-08-15 at 22:17 +0100, Burton, Ross wrote:
>> On 15 August 2012 22:12, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > eglibc was failing to build with make-3.81
>> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=2314
>> >
>> > so I guess once this is built (as webkit-gtk dependency), eglibc will maybe sometimes fail again..
>>
>> Interesting, this is the first time I've encountered 3.81 having
>> problems.  So we can't use 3.81 and we can't use 3.82 either. :)
>
> You can use 3.81, you just need to install it either under a different
> name (e.g. call it "make-3.81" and set $MAKE) or in a different
> directory (e.g. ${bindir}/make-3.81/make and set $PATH) so that other
> recipes don't pick it up unexpectedly.
>
> p.
>
The following is really dirty but at least to me it succeeds and to me
it seems to have less influences than the 'make 3.81 dance':

# dirty hack for gnu make 3.82 race condition
do_compile() {
    if [ x"$MAKE" = x ]; then MAKE=make; fi
    bbnote make ${PARALLEL_MAKE} "$@"
    for error_count in 1 2 3; do
        bbnote "Number of trials: $error_count"
        exit_code=0
        make ${PARALLEL_MAKE} "$@" || exit_code=1
        if [ $exit_code = 0 ]; then
            break
        fi
    done
    if [ ! $exit_code = 0 ]; then
        die "oe_runmake failed"
    fi
}

I have make 3.82 and before this I had 100% error at first do_compile.
For rerun (without cleanup) I had 100% success. Now I get 100% success
with make called twice. Would something like have a chance to be
accepted?

Andreas


