Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SjVEd-0003Tw-F7
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 14:51:11 +0200
Received: from [192.168.0.49] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id A211760002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 13:26:37 +0100 (BST)
Message-ID: <4FE9ADF2.3000209@communistcode.co.uk>
Date: Tue, 26 Jun 2012 13:41:22 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FE431E4.6070706@communistcode.co.uk> <4FE4A694.2040504@intel.com>
	<4FE8223B.3000105@communistcode.co.uk>
In-Reply-To: <4FE8223B.3000105@communistcode.co.uk>
Subject: Re: sgml-common sstate_task_postfunc failure
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
X-List-Received-Date: Tue, 26 Jun 2012 12:51:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/12 09:32, Jack Mitchell wrote:
> On 22/06/12 18:08, Scott Garman wrote:
>> On 06/22/2012 01:50 AM, Jack Mitchell wrote:
>>> I have had issues building sgml-common the past few days with oe-core
>>> master. Could anyone shed any light on the debug messages I am 
>>> receiving
>>> and what I could do to go about fixing them.
>>>
>>> I don't really understand the recipe, it seems to be some sort of
>>> surrogate recipe for transferring over specified files.
>>
>> The sgml catalog generation process has been plagued with race 
>> conditions and special cases like requiring SSTATEPOSTINSTFUNCS from 
>> the start - the problem is that unlike most packages, we're not 
>> installing static files but need to dynamically update the sgml 
>> catalog every time a new dtd gets installed.
>>
>> If this is reproducible, and you've only been experiencing it for the 
>> past few days, could you possibly bisect which commit has caused this 
>> error?
>>
>> Scott
>>
>>> snip...
>>>
>>
>
> Unfortunately I had not updated or been building for around a month so 
> while reproducible on my current build I cannot say when over the last 
> month the issue turned up! I will keep updating and keep investigating 
> to see if I can come up with a suggestion.
>
> I do have a quite a high parallel build at 12 threads, which has 
> caused problems in the past.
>
> Regards,
> Jack.
>

Ok, I think i'm getting somewhere with this, I have started a build from 
scratch and openjade fails to build, which leads me to think that it 
wasn't building properly in my old configuration but wasn't flagging up 
for some reason.

Here is the output of openjade build failure:

    [jack@archHP openjade]$ cat
    /home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/temp/log.do_compile.29301
    DEBUG: Executing shell function do_compile
    NOTE: make -j 12 depend
    make[1]: Entering directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2'
    make[2]: Entering directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2/grove'
    echo 'LT_OBJS='`echo Node.o LocNode.o|sed 's/\.o/.lo/g'` >Makefile.lt
    make[2]: Leaving directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2/grove'
    make[2]: Entering directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2/grove'
    g++ -MM
    -isystem/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/x86_64-linux/usr/include
    -O2 -pipe -I. -I./../include
    -I/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/x86_64-linux/usr/include/OpenSP
    -I/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/x86_64-linux/usr/include/OpenSP/..
    -DPACKAGE_NAME=\"openjade\" -DPACKAGE_TARNAME=\"openjade\"
    -DPACKAGE_VERSION=\"1.3.2\" -DPACKAGE_STRING=\"openjade\ 1.3.2\"
    -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DPACKAGE=\"openjade\"
    -DVERSION=\"1.3.2\" -DSP_DEFINE_TEMPLATES=1 -DSTDC_HEADERS=1
    -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1
    -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1
    -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1
    -DHAVE_LIMITS_H=1 -DHAVE_STRUCT_STAT_ST_BLKSIZE=1
    -DHAVE_ST_BLKSIZE=1 -DSIZEOF_SIZE_T=8 -DSIZEOF_UNSIGNED_INT=4
    -DSP_HAVE_LOCALE=1 -DSP_HAVE_WCHAR=1 -DSP_HAVE_GETTEXT=1
    -DSP_HAVE_BOOL=1 -DSP_ANSI_CLASS_INST=1 -DJADE_MIF=1 -DJADE_HTML=1
    -DSP_MULTI_BYTE=1 -DHAVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\"
    -DDEFAULT_SCHEME_BUILTINS=\"/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/x86_64-linux/usr/share/sgml/openjade-1.3.2/builtins.dsl\"
    -MM Node.cxx LocNode.cxx \
       | sed -e 's; \([^/ ][^/ ]*\)/; $(srcdir)/\1/;g' >depend.temp1
    cat depend.temp1 > depend.temp
    cat depend.temp1 | sed -e 's/\.o:/.lo:/g' >> depend.temp
    rm depend.temp1
    mv depend.temp Makefile.dep
    make[2]: Leaving directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2/grove'
    make[2]: Entering directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2/spgrove'
    echo 'LT_OBJS='`echo GroveApp.o GroveBuilder.o SdNode.o|sed
    's/\.o/.lo/g'` >Makefile.lt
    make[2]: Leaving directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2/spgrove'
    make[2]: Entering directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2/spgrove'
    rm -f grove_inst.cxx
    /usr/bin/perl ./../instmac.pl grove_inst.m4 >grove_inst.cxx
    chmod -w grove_inst.cxx
    g++ -MM
    -isystem/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/x86_64-linux/usr/include
    -O2 -pipe -I. -I./../include
    -I/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/x86_64-linux/usr/include/OpenSP
    -I/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/x86_64-linux/usr/include/OpenSP/..
    -I./../grove  -DPACKAGE_NAME=\"openjade\"
    -DPACKAGE_TARNAME=\"openjade\" -DPACKAGE_VERSION=\"1.3.2\"
    -DPACKAGE_STRING=\"openjade\ 1.3.2\" -DPACKAGE_BUGREPORT=\"\"
    -DPACKAGE_URL=\"\" -DPACKAGE=\"openjade\" -DVERSION=\"1.3.2\"
    -DSP_DEFINE_TEMPLATES=1 -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1
    -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1
    -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1
    -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_LIMITS_H=1
    -DHAVE_STRUCT_STAT_ST_BLKSIZE=1 -DHAVE_ST_BLKSIZE=1
    -DSIZEOF_SIZE_T=8 -DSIZEOF_UNSIGNED_INT=4 -DSP_HAVE_LOCALE=1
    -DSP_HAVE_WCHAR=1 -DSP_HAVE_GETTEXT=1 -DSP_HAVE_BOOL=1
    -DSP_ANSI_CLASS_INST=1 -DJADE_MIF=1 -DJADE_HTML=1 -DSP_MULTI_BYTE=1
    -DHAVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\"
    -DDEFAULT_SCHEME_BUILTINS=\"/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/x86_64-linux/usr/share/sgml/openjade-1.3.2/builtins.dsl\"
    -MM GroveApp.cxx GroveBuilder.cxx SdNode.cxx \
       | sed -e 's; \ERROR: Function failed: do_compile (see
    /home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/temp/log.do_compile.29301
    for further information)
    ([^/ ][^/ ]*\)/; $(srcdir)/\1/;g' >depend.temp1
    cat depend.temp1 > depend.temp
    cat depend.temp1 | sed -e 's/\.o:/.lo:/g' >> depend.temp
    rm depend.temp1
    mv depend.temp Makefile.dep
    make[2]: Leaving directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2/spgrove'
    make[2]: Entering directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2/style'
    echo 'LT_OBJS='`echo LangObj.o Collector.o DssslApp.o
    InterpreterMessages.o DssslSpecEventHandler.o ELObj.o
    ELObjMessageArg.o Expression.o FOTBuilder.o FlowObj.o InheritedC.o
    Insn.o Interpreter.o NumberCache.o ProcessContext.o ProcessingMode.o
    SchemeParser.o Style.o StyleEngine.o primitive.o GroveManager.o
    Pattern.o MacroFlowObj.o style_inst.o MessageModule.o |sed
    's/\.o/.lo/g'` >Makefile.lt
    make[2]: Leaving directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2/style'
    make[2]: Entering directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2/style'
    rm -f style_inst.cxx
    rm -f FlowObj_inst.cxx
    rm -f primitive_inst.cxx
    /usr/bin/perl ./../instmac.pl style_inst.m4 >style_inst.cxx
    /usr/bin/perl ./../instmac.pl FlowObj_inst.m4 >FlowObj_inst.cxx
    /usr/bin/perl -w ./../msggen.pl -l jstyleModule InterpreterMessages.msg
    /usr/bin/perl ./../instmac.pl primitive_inst.m4 >primitive_inst.cxx
    /usr/bin/perl -w ./../msggen.pl -l jstyleModule DssslAppMessages.msg
    chmod -w FlowObj_inst.cxx
    chmod -w primitive_inst.cxx
    chmod -w style_inst.cxx
    *Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
    make[2]: *** [InterpreterMessages.h] Error 2
    make[2]: *** Waiting for unfinished jobs....
    Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
    make[2]: *** [DssslAppMessages.h] Error 2*
    make[2]: Leaving directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2/style'
    make[1]: *** [style] Error 2
    make[1]: Leaving directory
    `/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/openjade-1.3.2'
    make: *** [depend] Error 2
    ERROR: oe_runmake failed
    [jack@archHP openjade]$


Now this seems to be a perl error, which could very well be related to 
the differing version of perl I have on my host system to the one built 
in oe-core. As a quick fix I am going to try using inherit perlnative to 
see if that solves it.

What could have happened is that Getopts has been depreciated or changed.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



