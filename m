Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D66265CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 22:03:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 25 Aug 2015 15:03:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,412,1437462000"; d="scan'208";a="548468788"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.76])
	([10.219.16.76])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2015 15:03:52 -0700
Message-ID: <55DCE649.70603@linux.intel.com>
Date: Tue, 25 Aug 2015 17:03:53 -0500
From: Mariano Lopez <mariano.lopez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: benjamin.esquivel@linux.intel.com, 
	openembedded-core@lists.openembedded.org
References: <1440518117-6722-1-git-send-email-mariano.lopez@linux.intel.com>	
	<1440518117-6722-4-git-send-email-mariano.lopez@linux.intel.com>
	<1440531859.15187.42.camel@linux.intel.com>
In-Reply-To: <1440531859.15187.42.camel@linux.intel.com>
Subject: Re: [PATCH 3/4 v2] dump: allow to have datastore vars on dump commands
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
X-List-Received-Date: Tue, 25 Aug 2015 22:03:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/25/2015 02:44 PM, Benjamin Esquivel wrote:
> Hi Mariano, please find my comments below.
>
> On Tue, 2015-08-25 at 10:55 -0500, mariano.lopez@linux.intel.com wrote:
>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>
>> This allows to have datastore variables in the dump
>> commands and will get the data when a new instance
>> it's created.
>>
>> Also this remove special cases from the commands.
>>
>> [YOCTO #8118]
>>
>> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
>> ---
>>   meta/classes/testimage.bbclass |  7 +++++--
>>   meta/lib/oeqa/utils/dump.py    | 42 ++++++++++++++++++++++++++------
>> ----------
>>   2 files changed, 31 insertions(+), 18 deletions(-)
>>
>> diff --git a/meta/classes/testimage.bbclass
>> b/meta/classes/testimage.bbclass
>> index 2131869..6a4b80a 100644
>> --- a/meta/classes/testimage.bbclass
>> +++ b/meta/classes/testimage.bbclass
>> @@ -63,11 +63,14 @@ testimage_dump_target () {
>>       ps
>>       free
>>       df
>> -    _ping
>> +    # The next command will export the default gateway IP
>> +    export DEFAULT_GATEWAY=$(ip route | awk '/default/ { print $3}')
>> +    ping -c3 $DEFAULT_GATEWAY
>>       dmesg
>>       netstat -an
>>       ip address
>> -    _logs
>> +    # Next command will dump logs from /var/log/
> suggestion to make this a function and call it from here.

It would be possible to add a bitbake var with the code.

>> +    find /var/log/ -type f 2>/dev/null -exec echo
>> "====================" \; -exec echo {} \; -exec echo
>> "====================" \; -exec cat {} \; -exec echo "" \;
>>   }
>>   
>>   testimage_dump_host () {
>> diff --git a/meta/lib/oeqa/utils/dump.py
>> b/meta/lib/oeqa/utils/dump.py
>> index a0fa699..a76aede 100644
>> --- a/meta/lib/oeqa/utils/dump.py
>> +++ b/meta/lib/oeqa/utils/dump.py
>> @@ -11,8 +11,24 @@ def get_host_dumper(d):
>>   
>>   class BaseDumper(object):
>>   
>> -    def __init__(self, d):
>> +    def __init__(self, d, cmds):
>> +        self.cmds = []
>>           self.parent_dir = d.getVar("TESTIMAGE_DUMP_DIR", True)
>> +        for cmd in cmds.split('\n'):
>> +            cmd = cmd.lstrip()
>> +            if not cmd or cmd[0] == '#':
>> +                continue
>> +            # Replae variables from the datastore
> *Replace
>> +            while True:
>> +                index_start = cmd.find("${")
>> +                if index_start == -1:
>> +                    break
>> +                index_start += 2
>> +                index_end = cmd.find("}", index_start)
>> +                var = cmd[index_start:index_end]
>> +                value = d.getVar(var, True)
>> +                cmd = cmd.replace("${%s}" % var, value)
>> +            self.cmds.append(cmd)
>>   
>>       def create_dir(self, dir_suffix):
>>           dump_subdir = ("%s_%s" % (
>> @@ -26,7 +42,7 @@ class BaseDumper(object):
>>                   raise err
>>           self.dump_dir = dump_dir
>>   
>> -    def write_dump(self, command, output):
>> +    def _write_dump(self, command, output):
>>           if isinstance(self, HostDumper):
>>               prefix = "host"
>>           elif isinstance(self, TargetDumper):
>> @@ -45,33 +61,27 @@ class BaseDumper(object):
>>   class HostDumper(BaseDumper):
>>   
>>       def __init__(self, d):
>> -        super(HostDumper, self).__init__(d)
>> -        self.host_cmds = d.getVar("testimage_dump_host", True)
>> +        host_cmds = d.getVar("testimage_dump_host", True)
>> +        super(HostDumper, self).__init__(d, host_cmds)
>>   
>>       def dump_host(self, dump_dir=""):
>>           if dump_dir:
>>               self.dump_dir = dump_dir
>> -        for cmd in self.host_cmds.split('\n'):
>> -            cmd = cmd.lstrip()
>> -            if not cmd or cmd[0] == '#':
>> -                continue
>> +        for cmd in self.cmds:
>>               result = runCmd(cmd, ignore_status=True)
>> -            self.write_dump(cmd.split()[0], result.output)
>> +            self._write_dump(cmd.split()[0], result.output)
>>   
>>   
>>   class TargetDumper(BaseDumper):
>>   
> Wondering why there is not a base class Dumper that inherits to
> TargetDumper and HostDumper

It is there, it's called BaseDumper

>>       def __init__(self, d, qemurunner):
>> -        super(TargetDumper, self).__init__(d)
>> -        self.target_cmds = d.getVar("testimage_dump_target", True)
>> +        target_cmds = d.getVar("testimage_dump_target", True)
>> +        super(TargetDumper, self).__init__(d, target_cmds)
>>           self.runner = qemurunner
>>   
>>       def dump_target(self, dump_dir=""):
>>           if dump_dir:
>>               self.dump_dir = dump_dir
>> -        for cmd in self.target_cmds.split('\n'):
>> -            cmd = cmd.lstrip()
>> -            if not cmd or cmd[0] == '#':
>> -                continue
>> +        for cmd in self.cmds:
>>               (status, output) = self.runner.run_serial(cmd)
>> -            self.write_dump(cmd.split()[0], output)
>> +            self._write_dump(cmd.split()[0], output)
>> -- 
>> 1.9.1
>>

-- 
Mariano Lopez

