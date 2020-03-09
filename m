Return-Path: <andrej.valek@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 60C856198B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 08:05:37 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 02985ZXX013566
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 9 Mar 2020 09:05:35 +0100
Received: from [192.168.20.128] ([163.242.56.79])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 02985ZHQ007191;
	Mon, 9 Mar 2020 09:05:35 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20200306153234.23875-1-andrej.valek@siemens.com>
	<fc1e74eeded8fc881df72be0623b528a7c0e6d5f.camel@linuxfoundation.org>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <bab60f8c-3c52-48e4-c453-db2cf1ea0542@siemens.com>
Date: Mon, 9 Mar 2020 09:05:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fc1e74eeded8fc881df72be0623b528a7c0e6d5f.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 09 Mar 2020 08:05:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello Richard,

I can try to explain it in some examples.

I would like to add some extra (dynamic) variables into local.conf in
eSDK mode. I have found, that there are 2 possibilities (in
populate_sdk_ext.bbclass) sdk-extra.conf and sdk_extraconf.

- sdk-extra.conf
 - You have to have handle own function to write into sdk-extra.conf. I
think, this is not the right way for me.
- sdk_extraconf
 - This variable is fine, but there are some restrictions. There is no
easy way to add multiple variables including values.

I would like to have:
aaa = "valueA"
bbb = "valueB"
in local.conf file.

1. sdk_extraconf = 'aaa = "valueA"\nbbb = "valueB"'
 - this will write aaa = "valueA"\nbbb = "valueB"
2. python copy_buildsystem_prepend() {
  d.setVar('sdk_extraconf','aaa = "valueA"\nbbb = "valueB"')
}
 - This will write exactly, what you want, but you have to have an
copy_buildsystem_prepend and mentioned all variables with values defined
in your class/recipe.
3. sdk_extraconf = "# My notes about local.conf"
 - Yes, you can write some string into local.conf with this way.

So I have founded an way, how to add multiple variables without
explicitly specifying their values.

# format variables for sdk_extraconf
def write_sdk_vars(d):
  return '\n' + '\n'.join([var + ' = "' + d.getVar(var) + '"' for var in
d.getVar('SDK_EXTRACONF_VARS').split()])

SDK_EXTRACONF_VARS = "aaa bbb"
sdk_extraconf_append = " ${@write_sdk_vars(d)}"

It will do exactly what I want, but this way is little bit nasty. So I
have created a more complex solution for community usage.
I think, this patch adds more functionality also for other projects.
They can add only variables into list and the class will handle all the
rest.

Is it enough for the explanation?

Regards,
Andrej

On 2020-03-06 18:16, Richard Purdie wrote:
> On Fri, 2020-03-06 at 16:32 +0100, Andrej Valek wrote:
>> "add option to append lines into local.conf":
>>  - What about dropping "sdk_extraconf"?
> 
> I'm curious what you didn't find useful about the other format and why
> this version is better?
> 
> Cheers,
> 
> Richard
> 

