Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QmOmO-0005jU-Gh
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 13:29:28 +0200
Received: by wyg30 with SMTP id 30so44027wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 04:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Gru4vcszTWJYci7J19kpvd+257P7ButRfLHrCSTrUv0=;
	b=HwLBuRcWgR7Z22dCKjvrjJrAdYZyh9dwVkqreYGKxav24H3wdZfdFbdCNHpOHF5iiS
	zsagQ7Ob1T4gNGo18cJsuNpbdQblCunw20hcyxbPWQNbsHPFDbXG9YxFaTIN343foStr
	HjLuj5BG+HDEkQ2tZqpH4Fdy2dJxKjW+IfADw=
MIME-Version: 1.0
Received: by 10.227.202.19 with SMTP id fc19mr1256067wbb.61.1311852312967;
	Thu, 28 Jul 2011 04:25:12 -0700 (PDT)
Received: by 10.227.23.209 with HTTP; Thu, 28 Jul 2011 04:25:12 -0700 (PDT)
In-Reply-To: <1311847629.30326.428.camel@phil-desktop>
References: <CAGiJk9fwxUGUbb1Fwf731X+Ujz4RN_3OkXpGHcJq+ER_sYMRQQ@mail.gmail.com>
	<1311847629.30326.428.camel@phil-desktop>
Date: Thu, 28 Jul 2011 13:25:12 +0200
Message-ID: <CAGiJk9emSr5yhzRcYxrsuEg9Tjr4XFOJKpEPFR2VymWY+24KJg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Sanity check failed after glibc deletion (was: Re: [PATCH] glibc: deleted)
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
X-List-Received-Date: Thu, 28 Jul 2011 11:29:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The oebb.sh script can be used to update all openembedded-core layers
and custom added sources from the layers.txt file in
"oe-core-dir/setup-scripts/sources/layers.txt".
After checking my local repositories with git-log again, I found out
that your patch is not responsible for this.
It seems like something else (most likely not openembedded-core
related) has caused this error.

My desktop PC runs a 64bit Linux.
After locating the error message in sanity.bbclass (line 279) which
follows, either (like you said) the stubs-32.h was removed or some
strange lib configurations applied something to my PC.
This could not be caused from updating the git repositories or
applying patches, so something else must have happened (I still wonder
what).
And since it occured right after i updated my sources my first guess
was glibc, I should have looked in the sanity.bbclass earlier.
--
if os.path.exists('%s/libc.so.6' % lib32path) and not
os.path.exists('/usr/include/gnu/stubs-32.h'):
          messages =3D messages + "You have a 32-bit libc, but no 32-bit
headers.  You must install the 32-bit libc headers.\n"
--
After I re-installed gcc-multilib the error disappeared.
Seems odd to me but the problems are gone.

Regards
--Samuel

2011/7/28 Phil Blundell <philb@gnu.org>:
> I'm not familiar with oebb.sh or its functionality. =A0But, from what
> you're saying below it sounds as though it works something like
> "git-am". =A0If I'm understanding correctly you used it to apply the glib=
c
> deletion patch, and now you get this sanity failure (whereas you didn't
> get it immediately before applying the patch). =A0Is that right?
>
> I can't think of any reason why deleting the glibc recipes would cause
> the 32-bit header check to start failing, and that error certainly isn't
> happening for me. =A0If you revert the patch, does the failure go away?
> Have you verified that you really do have gnu/stubs-32.h installed in
> the appropriate place?
>
> p.
>
> On Thu, 2011-07-28 at 09:30 +0200, Samuel Stirtzel wrote:
>> My current configuration was set up with the help of the Angstrom
>> instructions [1], and I applied patches via the "oebb.sh update"
>> command.
>> Running Bitbake would show the following sanity error on any image / mac=
hine:
>>
>> samuel@S-Linux:/var/oe-core/setup-scripts$ bitbake console-image
>> ERROR: =A0Poky's config sanity checker detected a potential misconfigura=
tion.
>> =A0 =A0 Either fix the cause of this error or at your own risk disable t=
he
>> checker (see sanity.conf).
>> =A0 =A0 Following is the list of potential problems / advisories:
>>
>> =A0 =A0 You have a 32-bit libc, but no 32-bit headers. =A0You must insta=
ll
>> the 32-bit libc headers.
>>
>> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
>>
>>
>> For me it looks like an error with my configuration, but on the other
>> side, before the update building images with bitbake worked.
>> Well I don't know exactly if this is caused by the glibc deletion, but
>> IMHO it seems very likely.
>> Anyone else faced the same problem?
>>
>> Help would be very appreciated.
>>
>> Regards
>> --Samuel
>>
>> [1] http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/=
tree/README
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


