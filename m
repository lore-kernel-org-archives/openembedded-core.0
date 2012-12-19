Received: from co9ehsobe001.messaging.microsoft.com ([207.46.163.24]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TlPMS-0002SQ-70
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 20:31:47 +0100
Received: from mail144-co9-R.bigfish.com (10.236.132.254) by
	CO9EHSOBE024.bigfish.com (10.236.130.87) with Microsoft SMTP Server id
	14.1.225.23; Wed, 19 Dec 2012 19:01:36 +0000
Received: from mail144-co9 (localhost [127.0.0.1])	by
	mail144-co9-R.bigfish.com (Postfix) with ESMTP id 003D83A0271;
	Wed, 19 Dec 2012 19:01:36 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I936eI1432I4015Izz1de0h1202h1e76h1d1ah1d2ahzz8275dh8275bhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758hbe9i1155h)
Received: from mail144-co9 (localhost.localdomain [127.0.0.1]) by mail144-co9
	(MessageSwitch) id 1355943693766356_24072;
	Wed, 19 Dec 2012 19:01:33 +0000 (UTC)
Received: from CO9EHSMHS026.bigfish.com (unknown [10.236.132.245])	by
	mail144-co9.bigfish.com (Postfix) with ESMTP id AA4A98005A;
	Wed, 19 Dec 2012 19:01:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS026.bigfish.com
	(10.236.130.36) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 19 Dec 2012 19:01:23 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.11]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0318.003;
	Wed, 19 Dec 2012 19:01:22 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [for-denzil] bitbake: command: add error to return
	of runCommand
Thread-Index: AQHN3WaaMZAbWw9hj021e5/UA+7dD5gge5EA
Date: Wed, 19 Dec 2012 19:01:22 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A7FABB1@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1355851135-31667-1-git-send-email-msm@freescale.com>
	<1355866085.18874.46.camel@ted>
In-Reply-To: <1355866085.18874.46.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-denzil] bitbake: command: add error to return of runCommand
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 19:31:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8E598D4E1715964187FE25F8B76542E9@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2012 at 3:28 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-12-18 at 11:18 -0600, Matthew McClintock wrote:
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> Currently, command.py can return an error message from runCommand, due t=
o
>> being unable to run the command, yet few of our UIs (just hob) can handl=
e it
>> today. This can result in seeing a TypeError with traceback in certain r=
are
>> circumstances.
>>
>> To resolve this, we need a clean way to get errors back from runCommand,
>> without having to isinstance() the return value. This implements such a =
thing
>> by making runCommand also return an error (or None if no error occurred)=
.
>>
>> As runCommand now has a method of returning errors, we can also alter th=
e
>> getCmdLineAction bits such that the returned value is just the action, n=
ot an
>> additional message. If a sync command wants to return an error, it raise=
s
>> CommandError(message), and the message will be passed to the caller
>> appropriately.
>>
>> Example Usage:
>>
>>     result, error =3D server.runCommand(...)
>>     if error:
>>         log.error('Unable to run command: %s' % error)
>>         return 1
>>
>> (Bitbake rev: 717831b8315cb3904d9b590e633000bc897e8fb6)
>
> This patch has bugs in it. See recent fixes in master.
>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  bitbake/lib/bb/command.py                   |   43 +++++++++++++++-----=
-----
>>  bitbake/lib/bb/server/process.py            |    2 +-
>>  bitbake/lib/bb/ui/crumbs/hobeventhandler.py |    5 ++-
>>  bitbake/lib/bb/ui/depexp.py                 |   38 ++++++++++++++------=
--
>>  bitbake/lib/bb/ui/goggle.py                 |   17 +++++-----
>>  bitbake/lib/bb/ui/knotty.py                 |   45 ++++++++++++++++++--=
-------
>>  bitbake/lib/bb/ui/ncurses.py                |   21 ++++++++-----
>>  7 files changed, 112 insertions(+), 59 deletions(-)
>>
>> diff --git a/bitbake/lib/bb/command.py b/bitbake/lib/bb/command.py
>> index fd8912a..00b854e 100644
>> --- a/bitbake/lib/bb/command.py
>> +++ b/bitbake/lib/bb/command.py
>> @@ -44,6 +44,9 @@ class CommandFailed(CommandExit):
>>          self.error =3D message
>>          CommandExit.__init__(self, 1)
>>
>> +class CommandError(Exception):
>> +    pass
>> +
>>  class Command:
>>      """
>>      A queue of asynchronous commands for bitbake
>> @@ -57,21 +60,25 @@ class Command:
>>          self.currentAsyncCommand =3D None
>>
>>      def runCommand(self, commandline):
>> -        try:
>> -            command =3D commandline.pop(0)
>> -            if command in CommandsSync.__dict__:
>> -                # Can run synchronous commands straight away
>> -                return getattr(CommandsSync, command)(self.cmds_sync, s=
elf, commandline)
>> -            if self.currentAsyncCommand is not None:
>> -                return "Busy (%s in progress)" % self.currentAsyncComma=
nd[0]
>> -            if command not in CommandsAsync.__dict__:
>> -                return "No such command"
>> -            self.currentAsyncCommand =3D (command, commandline)
>> -            self.cooker.server_registration_cb(self.cooker.runCommands,=
 self.cooker)
>> -            return True
>> -        except:
>> -            import traceback
>> -            return traceback.format_exc()
>> +        command =3D commandline.pop(0)
>> +        if hasattr(CommandsSync, command):
>> +            # Can run synchronous commands straight away
>> +            command_method =3D getattr(self.cmds_sync, command)
>> +            try:
>> +                result =3D command_method(self, commandline)
>> +            except CommandError as exc:
>> +                return None, exc.args[0]
>> +            except Exception:
>> +                return None, traceback.format_exc()
>
> Missing import traceback.
>
>> +            else:
>> +                return result, None
>> +        if self.currentAsyncCommand is not None:
>> +            return None, "Busy (%s in progress)" % self.currentAsyncCom=
mand[0]
>> +        if command not in CommandsAsync.__dict__:
>> +            return None, "No such command"
>> +        self.currentAsyncCommand =3D (command, commandline)
>> +        self.cooker.server_registration_cb(self.cooker.runCommands, sel=
f.cooker)
>> +        return True, None
>>
>>      def runAsyncCommand(self):
>>          try:
>> @@ -139,7 +146,11 @@ class CommandsSync:
>>          """
>>          Get any command parsed from the commandline
>>          """
>> -        return command.cooker.commandlineAction
>> +        cmd_action =3D command.cooker.commandlineAction
>> +        if cmd_action['msg']:
>> +            raise CommandError(msg)
>
> Error, "msg" not defined.

Thanks, will look for these and add them / send to list as well. Look
for another patch when I get to it.

-M=



