Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T1jBM-0006dZ-9s
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 21:23:08 +0200
Received: by lagv3 with SMTP id v3so956558lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 12:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=8TQkAAbJzrxrzG1iD5COvPUJj78/3gQXT7gJYxWEwes=;
	b=zQbrvXmhOCS1xDQb2zHjRoGTvM0t92QBJHVkl0Ph4QLa1/8PBm8oAkQmQxlnTrnl0r
	GQ0Aw1zx3SkqaYpx33wugyN5mHDz8rCIE24/GdrTI5qoyxd/oILpoD5+ElL7Jp0ZSAsy
	Zfye2wydP3oFAS0RIfxvTLe4l0LGHPizPJDInwaZgf+K8TDcmg6jdICUyCclf9rUdMH+
	2DPAFBEaPbPAcEkcQcxBrwWtXcAFGoo005OIQgAQ8+Rkjg+98qNNDmpqcCoK8KZkhDH2
	lSoAra0ojvBNNU45wm7+LRbCa1mPCpsApO/dNeOsb7HkreE6NihHFiZLMlTUuXXXnFXF
	x15A==
Received: by 10.112.51.195 with SMTP id m3mr9723297lbo.17.1345057871752; Wed,
	15 Aug 2012 12:11:11 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.5.104 with HTTP; Wed, 15 Aug 2012 12:10:51 -0700 (PDT)
In-Reply-To: <CAEsOVNcVB5zp7rhN4LP7ANx3hDq51kFQt_0L=O5=YLU6Qp_D-Q@mail.gmail.com>
References: <1343052252-4154-1-git-send-email-radu.moisan@intel.com>
	<lywr1uzguj.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<500E50C5.8000403@intel.com>
	<CABcZANkJhW+yER52vnbXSywxd-mhpNTPrFixL6R27thmMRmhMg@mail.gmail.com>
	<CAJTo0LYT5Jup6SXnmA62+Wy8sua94BdB_VwuHJ8erK1gshaYFw@mail.gmail.com>
	<CAEsOVNcVB5zp7rhN4LP7ANx3hDq51kFQt_0L=O5=YLU6Qp_D-Q@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 15 Aug 2012 12:10:51 -0700
X-Google-Sender-Auth: ums6xDde7i93zXeZP8izwBChCF4
Message-ID: <CABcZANkfFMgTxeQWzpKe2d2NqhMYaz27q-dnfW5m7-BJO2yygQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kmod: Handle undefined O_CLOEXEC
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
X-List-Received-Date: Wed, 15 Aug 2012 19:23:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 15, 2012 at 11:37 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Tue, Jul 24, 2012 at 8:40 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 24 July 2012 14:27, Chris Larson <clarson@kergoth.com> wrote:
>>> On Tue, Jul 24, 2012 at 12:37 AM, Radu Moisan <radu.moisan@intel.com> wrote:
>>>> I have not tested on CentOS 5.8 if the applications are not broken in some
>>>> way, but that's not in the scope of this patch. If something does indeed
>>>> break, then a totally different patch is required, targeting a backport of
>>>> kmod for kernel older than 2.6.23.
>>>
>>> Personally, I'd rather see the build fail than have the tools behave
>>> incorrectly in some inexplicable way. If you haven't tested it, the
>>> patch shouldn't go in.
>>
>> I was curious...
>>
>> There are two commits in kmod where the cloexec changes were made:
>>
>> http://git.profusion.mobi/cgit.cgi/kmod.git/log/?qt=grep&q=cloexec
>>
>> The changes were a simple addition of the O_CLOEXEC flag, so this
>> patch is simply the union of those two commits.  A release of kmod
>> that doesn't require O_CLOEXEC has the same behaviour as this patch.
>> The problem O_CLOEXEC is solving isn't possible to solve cleanly
>> without it.  Using an older version of kmod instead of patching kmod
>> to work on older systems would result in more bugs and less features
>> for no win.
>
> Was there any conclusion on this? I'm seeing the same problems. This
> would only effect kmod-native (unless the target was using the older
> stuff as well which is uncommon at this point).

For what it's worth, we applied this in our layer and things do seem
to work fine with this applied. It was either this or what we did
before (reverted the switch to kmod-native and retained
module-init-tools-cross), as we require CentOS5/RHEL5 support still.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


