Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RKvSm-00018J-FT
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 18:15:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 31 Oct 2011 10:09:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="69429945"
Received: from unknown (HELO [10.7.199.77]) ([10.7.199.77])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2011 10:09:50 -0700
Message-ID: <4EAED65D.8060205@linux.intel.com>
Date: Mon, 31 Oct 2011 10:09:49 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1319844419.git.josh@linux.intel.com>
	<988279ad6b90b50cf85426709540ce19b00745e6.1319844419.git.josh@linux.intel.com>
	<CABcZANkS9zDK-qLtMxHdn7SE29vTz+HPMwCUtf=yP-uuGV=Dtg@mail.gmail.com>
In-Reply-To: <CABcZANkS9zDK-qLtMxHdn7SE29vTz+HPMwCUtf=yP-uuGV=Dtg@mail.gmail.com>
Subject: Re: [PATCH 1/4] lib/oe/terminal: add support for XFCE's terminal emulator
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
X-List-Received-Date: Mon, 31 Oct 2011 17:15:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28/10/11 17:56, Chris Larson wrote:
> On Fri, Oct 28, 2011 at 4:42 PM, Joshua Lock <josh@linux.intel.com> wrote:
>> That's Terminal on Fedora and xfce4-terminal on Ubuntu/Debian... This
>> could get interesting!
>>
>> Signed-off-by: Joshua Lock <josh@linux.intel.com>
>> ---
>>  meta/lib/oe/terminal.py |   21 +++++++++++++++++++++
>>  1 files changed, 21 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
>> index 1455e8e..b90a1f2 100644
>> --- a/meta/lib/oe/terminal.py
>> +++ b/meta/lib/oe/terminal.py
>> @@ -57,6 +57,27 @@ class Gnome(XTerminal):
>>     command = 'gnome-terminal --disable-factory -t "{title}" -x {command}'
>>     priority = 2
>>
>> +class Xfce(XTerminal):
>> +    def distro_name():
>> +        import subprocess as sub
>> +        try:
>> +            p = sub.Popen(['lsb_release', '-i'], stdout=sub.PIPE,
>> +                          stderr=sub.PIPE)
>> +            out, err = p.communicate()
>> +            distro = out.split(':').strip()
>> +        except:
>> +            distro = "unknown"
>> +        return distro
>> +
>> +    # Upstream binary name is Terminal but Debian/Ubuntu use
>> +    # xfce4-terminal to avoid possible(?) conflicts
>> +    distro = distro_name()
>> +    if distro == 'Ubuntu' or distro == 'Debian':
>> +        command = 'xfce4-terminal -T "{title}" -e "{command}"'
>> +    else:
>> +        command = 'Terminal -T "{title}" -e "{command}"'
>> +    priority = 2
> 
> The first problem I see with this is you're calling lsb_release at
> module import time. Doing things like that is generally a no-no. I'd
> suggest shifting it into the constructor. Set up the command there as
> self.command, and be sure to call the superclass constructor as well,
> after the command bits. The other thing is, and I'm sure you just
> copied & pasted it from konsole, but we already import a fully
> functional Popen -- it's the superclass of all the terminal classes.
> So there's no need to pull in subprocess's version of it. And the
> defaults of the Popen we use ensure the output is captured, so there's
> no need for the sub.PIPE bits at all if you use that one. Simply do p
> = Popen(['lsb_release', '-i']).

Thanks for the feedback Chris. I'll roll your suggestions into a v2 today.

> 
> Thanks for adding this, I'm sure folks using stock Xubuntu and the
> like will find this helpful (I'm an rxvt-unicode guy myself).

I figured that DE would be getting more popular, hence throwing a patch
together.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


