Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TStQc-0004tf-Vt
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 18:47:11 +0100
Received: by mail-lb0-f175.google.com with SMTP id y2so3190627lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 10:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=MmxEicCn+eEkO6uU+kCkXgOMJ0ahU/jIqVVzf000zk4=;
	b=y0zqcFnsO5L3cpR0nYXjhcHLG0sEZysgGTOKdhULubgszscJwkP1WzhnE1FbRg3i3i
	DTmZkGG9xXtrRe7wINom/BGjiBUmAbNLqgnDMWcxXdRsydPSpJ0tOUB9edzgrqwCGOej
	wwaJMUX9bKQ5/Me9sD29i3Hd0SstDhemDb4LEiZHlCtm03ubNG24awIpWK/v/QnvQrWk
	DCZ8QN7Ac3F+VhsUb/MtOGyWRtPf37ZBe6+S1e07kaVRJfMRCnhYdwGoFLBWuNY/y/nF
	dSucHMPQpUj7fNLjxSTeDhZ2qeAhZ1eF3O8AqnPfDKfDyYyU1V+yJO/w/gMx0Z9QSEyp
	gOUQ==
Received: by 10.112.24.6 with SMTP id q6mr12459707lbf.24.1351532016573; Mon,
	29 Oct 2012 10:33:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.1.49 with HTTP; Mon, 29 Oct 2012 10:33:16 -0700 (PDT)
In-Reply-To: <1351525416.2828.12.camel@ted>
References: <1351517628.13864.4.camel@phil-desktop>
	<1351525416.2828.12.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 29 Oct 2012 10:33:16 -0700
X-Google-Sender-Auth: bve9YB278m7aHJKLpicskKBrJd0
Message-ID: <CABcZANmzfXiXA5rdNQpqo33wXyFPz518dCkLe0x7rZGjOZ=Ucw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: What is TOOLCHAIN_NEED_CONFIGSITE_CACHE for?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2012 17:47:11 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 29, 2012 at 8:43 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2012-10-29 at 13:33 +0000, Phil Blundell wrote:
>> This morning I happened to notice that some/all of my images had a
>> dependency on ncurses for no obviously good reason.  (Following an
>> earlier small crusade these are now the only remaining dependencies on
>> ncurses in my build, so I would quite like to get rid of them.)
>>
>> It turns out that the dependency in question is due to the code in
>> toolchain-scripts.bbclass (which is inherited from
>> populate_sdk_base.bbclass, from image.bbclass) which does:
>>
>> TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
>>
>> [...]
>>
>> python __anonymous () {
>>     deps = ""
>>     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
>>         deps += " %s:do_populate_sysroot" % dep
>>     d.appendVarFlag('do_configure', 'depends', deps)
>> }
>>
>> The code in question was added in:
>>
>> commit 9e87f1347788beed181476dc4563085db14a4729
>> Author: Lianhao Lu <lianhao.lu@intel.com>
>> Date:   Tue Aug 16 11:15:36 2011 +0800
>>
>>     toolchain-script.bbclass: Collected cached site config in runtime.
>>
>>     [YOCTO #892]
>>     Modify the function toolchain_create_sdk_siteconfig to collect the
>>     cached site config files which are specified by
>>     TOOLCHAIN_NEED_CONFIGSITE_CACHE in runtime.
>>
>>     Also added task dependency to ensure the cached site config files are
>>     generated.
>>
>>     Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
>>
>> ... but I don't entirely understand from that commentary what exactly is
>> special about ncurses that means it needs to be handled this way.  Can
>> anybody clarify?
>
> We ship the "site" cache files with the toolchain. We decided to include
> the generated cache files as well as the static ones. We currently
> generate "site" files for libc and ncurses.
>
> You can almost certainly just set:
>
> TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC}"
>
> and be happy since this just lists which generated cache site files to
> include.

Shouldn't it be pulled in via depends from the populate_sdk bits,
rather than a task that's used both for image builds and toolchain
builds, though?
-- 
Christopher Larson


