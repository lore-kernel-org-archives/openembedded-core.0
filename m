Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RAq5x-00027Q-GL
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 23:30:41 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 03 Oct 2011 14:25:07 -0700
Received: by bke5 with SMTP id 5so5762219bke.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 14:25:05 -0700 (PDT)
Received: by 10.223.41.153 with SMTP id o25mr515856fae.79.1317677105553;
	Mon, 03 Oct 2011 14:25:05 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id n18sm10311010fah.2.2011.10.03.14.24.59
	(version=SSLv3 cipher=OTHER); Mon, 03 Oct 2011 14:25:02 -0700 (PDT)
Message-ID: <4E8A2828.7090202@intel.com>
Date: Mon, 03 Oct 2011 14:24:56 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317660469.13337.16.camel@phil-desktop>
	<CAEsOVNcZbs3TBQiBYnpzk4UgbfSwFYNHfkChhjN3FOcjnp4qUw@mail.gmail.com>
In-Reply-To: <CAEsOVNcZbs3TBQiBYnpzk4UgbfSwFYNHfkChhjN3FOcjnp4qUw@mail.gmail.com>
Subject: Re: sstate_clean() overzealous?
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
X-List-Received-Date: Mon, 03 Oct 2011 21:30:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2011 02:11 PM, McClintock Matthew-B29882 wrote:
> On Mon, Oct 3, 2011 at 11:47 AM, Phil Blundell<philb@gnu.org>  wrote:
>> The sstate_clean() function in sstate.bbclass is doing (inter alia):
>>
>>     stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
>>     [...]
>>     oe.path.remove(stfile + ".*")
>>     oe.path.remove(stfile + "_setscene" + ".*")
>>
>> which means that, for tasks which set the stamp-extra-info flag to
>> ${MACHINE}, it ends up blowing away the stamps for all machines rather
>> than just the current one.  The net effect of this seems to be that
>> there is no way to have the setscene stamps populated for more than one
>> MACHINE at any time, and hence all those tasks get rerun every time you
>> change MACHINE even if nothing else has been altered.
>>
>> Is this behaviour deliberate?  It is certainly a little bit annoying but
>> I don't understand the internals of sstate well enough to judge what
>> exactly that glob is trying to accomplish.
>
> I've noticed that changing the MACHINE will also invalidate the
> -native stuff as well.
>
I am not sure that's correct, since we use sstate with the Autobuilder 
and it's shared across different hosts building different MACHINEs, we 
don't see the -natives getting build, do you have any examples?

Sau!

> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



