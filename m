Return-Path: <andrej.valek@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE6E608DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 09:05:43 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 02H95g59011984
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 17 Mar 2020 10:05:42 +0100
Received: from [192.168.20.128] ([167.87.103.117])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02H95fc4012160;
	Tue, 17 Mar 2020 10:05:41 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20200306153234.23875-1-andrej.valek@siemens.com>
	<fc1e74eeded8fc881df72be0623b528a7c0e6d5f.camel@linuxfoundation.org>
	<bab60f8c-3c52-48e4-c453-db2cf1ea0542@siemens.com>
	<df089c009e2e77be0383c6b1222cfb71095669f0.camel@linuxfoundation.org>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <ce011feb-0edc-dffb-454e-b3ffaa5a42e0@siemens.com>
Date: Tue, 17 Mar 2020 10:05:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <df089c009e2e77be0383c6b1222cfb71095669f0.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/2] Extensible SDK improvements
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
X-List-Received-Date: Tue, 17 Mar 2020 09:05:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello Richard,

Thank you for taking care of it. I didn't know, that is possible to use
"functions" in d.getVar case. Yes, I have tested it. And yes, what you
have mentioned is working, as we were expecting.

I will rather use my mechanism to just fill a list with variables. Then
I don't need to take a care, if there are fully expanded it or not.

So we can keep like it is.

But, yes, a small improvement for someone else could be, that we will
put a "False" there, but not for me.

Regards,
Andrej

On 2020-03-16 14:07, Richard Purdie wrote:
> Hi Andrej,
> 
> On Mon, 2020-03-09 at 09:05 +0100, Andrej Valek wrote:
>> I can try to explain it in some examples.
>>
>> I would like to add some extra (dynamic) variables into local.conf in
>> eSDK mode. I have found, that there are 2 possibilities (in
>> populate_sdk_ext.bbclass) sdk-extra.conf and sdk_extraconf.
>>
>> - sdk-extra.conf
>>  - You have to have handle own function to write into sdk-extra.conf. 
>> I
>> think, this is not the right way for me.
>> - sdk_extraconf
>>  - This variable is fine, but there are some restrictions. There is
>> no
>> easy way to add multiple variables including values.
>>
>> I would like to have:
>> aaa = "valueA"
>> bbb = "valueB"
>> in local.conf file.
>>
>> 1. sdk_extraconf = 'aaa = "valueA"\nbbb = "valueB"'
>>  - this will write aaa = "valueA"\nbbb = "valueB"
>> 2. python copy_buildsystem_prepend() {
>>   d.setVar('sdk_extraconf','aaa = "valueA"\nbbb = "valueB"')
>> }
>>  - This will write exactly, what you want, but you have to have an
>> copy_buildsystem_prepend and mentioned all variables with values
>> defined in your class/recipe.
> 
> Why do you have to set this in a copy_buildsystem_prepend ? Shouldn't
> setting the variable in your distro config or class or somewhere else
> work?
> 
>> 3. sdk_extraconf = "# My notes about local.conf"
>>  - Yes, you can write some string into local.conf with this way.
> 
> I suspect you can also do:
> 
> sdk_extraconf () {
> # My notes about local.conf
> aaa = "valueA"
> bbb = "valueB"
> }
> 
> or something like that, I admit I've not tested it though.
> 
>> So I have founded an way, how to add multiple variables without
>> explicitly specifying their values.
>>
>> # format variables for sdk_extraconf
>> def write_sdk_vars(d):
>>   return '\n' + '\n'.join([var + ' = "' + d.getVar(var) + '"' for var
>> in
>> d.getVar('SDK_EXTRACONF_VARS').split()])
>>
>> SDK_EXTRACONF_VARS = "aaa bbb"
>> sdk_extraconf_append = " ${@write_sdk_vars(d)}"
>>
>> It will do exactly what I want, but this way is little bit nasty. So
>> I have created a more complex solution for community usage.
>> I think, this patch adds more functionality also for other projects.
>> They can add only variables into list and the class will handle all
>> the
>> rest.
> 
> I do see the problem with expansion. I suspect the code in
> populate_sdk_ext should be:
> 
> extraconf = (d.getVar('sdk_extraconf', False) or '').strip()
> instead of:
> extraconf = (d.getVar('sdk_extraconf') or '').strip()
> 
> so that variables can be used as part of the expressions. It may be our
> change to the defaults for getVar messed this up, or it may be we just
> didn't correctly predict this problem.
> 
>> Is it enough for the explanation?
> 
> It helps, yes, thanks. What I don't want to do is add multiple
> confusing mechanisms which do approximately the same thing slightly
> differently. I'd much prefer one mechanism most people can use.
> 
> As such the original proposal still concerns me. I'd prefer to tweak
> one of the existing ones (even merge them!) rather than add a third
> slightly different one.
> 
> I do also still think some (but not all) of what you're describing
> should be in your distro/classes rather than local.conf.
> 
> Is there a way we can improve the current code rather than adding more
> options. Would the expansion change be enough?
> 
> Cheers,
> 
> Richard
> 
> 

