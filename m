Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Sc0ug-0007fS-HJ
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 23:03:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Jun 2012 13:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108227194"
Received: from unknown (HELO envy.home) ([10.255.12.60])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jun 2012 13:53:07 -0700
Message-ID: <4FCE716E.7010309@linux.intel.com>
Date: Tue, 05 Jun 2012 13:51:58 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
References: <1338835664-27699-1-git-send-email-jason.wessel@windriver.com>
	<CAPhnLPBktoKn7UJKahYpWwf56CzRDZPjGdoh1nH1t5z6F5DwGw@mail.gmail.com>
In-Reply-To: <CAPhnLPBktoKn7UJKahYpWwf56CzRDZPjGdoh1nH1t5z6F5DwGw@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] perl: Allow perl to cross build and native build in a directory named "t"
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
X-List-Received-Date: Tue, 05 Jun 2012 21:03:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/05/2012 01:25 PM, Flanagan, Elizabeth wrote:
> On Mon, Jun 4, 2012 at 11:47 AM, Jason Wessel
> <jason.wessel@windriver.com> wrote:
>> If any directory in leading up to your tmp directory has the name "t"
>> perl will fail to build with a very cryptic error shown below:
> 
> 
> Jason,
> 
> I'm currently testing this patch and it seems to be causing failures
> during do_compile for poky-tiny

Which image are you trying to build with DISTRO="poky-tiny" ?

> 
> http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/71/steps/shell_35/logs/stdio
> 
> | /bin/ln -s perldelta.pod pod/perl5142delta.pod
> | ./miniperl -Ilib autodoc.pl
> | make[1]: ./miniperl: Command not found
> | make[1]: *** [pod/perlintern.pod] Error 127
> | make[1]: Leaving directory
> `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-tiny/build/build/tmp/work/i586-poky-linux/perl-5.14.2-r7/perl-5.14.2'
> | make: *** [perl] Error 2
> | ERROR: oe_runmake failed
> 
> -b
> 
>>
>> pod/buildtoc: no pods at pod/buildtoc line 305.
>> make[1]: *** [pod/perltoc.pod] Error 255
>>
>> This is a result of the perl file checking making an assumption
>> that it is only looking at files and directories with in the perl
>> source directory.  This assumption fails with the way bitbake
>> sets up perl to properly cross compile.
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>  .../perl/perl-5.14.2/perl-build-in-t-dir.patch     |   42 ++++++++++++++++++++
>>  meta/recipes-devtools/perl/perl-native_5.14.2.bb   |    5 ++-
>>  meta/recipes-devtools/perl/perl_5.14.2.bb          |    3 +-
>>  3 files changed, 47 insertions(+), 3 deletions(-)
>>  create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
>>
>> diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch b/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
>> new file mode 100644
>> index 0000000..16064ed
>> --- /dev/null
>> +++ b/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
>> @@ -0,0 +1,42 @@
>> +Upstream-Status:Pending
>> +
>> +Perl cannot cross build in a path containing a directory that has the
>> +name of "t".  As an example, you can make the perl build fail with
>> +"mkdir -p /tmp/build/t", go to the directory, unpack the sources,
>> +configure and cross build.
>> +
>> +You get an error like the following:
>> +    pod/buildtoc: no pods at pod/buildtoc line 305.
>> +    make[1]: *** [pod/perltoc.pod] Error 255
>> +
>> +The fix is to strip off the top directory that you are building in and
>> +then execute all the same logic as before against the path relative to
>> +the build directory.
>> +
>> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> +---
>> + pod/buildtoc |    4 +++-
>> + 1 file changed, 3 insertions(+), 1 deletion(-)
>> +
>> +--- a/pod/buildtoc
>> ++++ b/pod/buildtoc
>> +@@ -274,8 +274,10 @@ if ($Build{toc}) {
>> +   find \&getpods => abs_from_top('lib/');
>> +
>> +   sub getpods {
>> ++    my $Top = $FindBin::Bin;
>> +     if (/\.p(od|m)$/) {
>> +       my $file = $File::Find::name;
>> ++      $file =~ s!^$Top!!;
>> +       return if $file =~ qr!/lib/Pod/Functions.pm\z!; # Used only by pod itself
>> +       return if $file =~ m!(?:^|/)t/!;
>> +       return if $file =~ m!lib/Attribute/Handlers/demo/!;
>> +@@ -283,7 +285,7 @@ if ($Build{toc}) {
>> +       return if $file =~ m!lib/Math/BigInt/t/!;
>> +       return if $file =~ m!/Devel/PPPort/[Hh]arness|lib/Devel/Harness!i;
>> +       return if $file =~ m!XS/(?:APItest|Typemap)!;
>> +-      my $pod = $file;
>> ++      my $pod = $file = $File::Find::name;
>> +       return if $pod =~ s/pm$/pod/ && -e $pod;
>> +       unless (open my $f, '<', $_) {
>> +       warn "$0: bogus <$file>: $!";
>> diff --git a/meta/recipes-devtools/perl/perl-native_5.14.2.bb b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
>> index c904c37..df8f058 100644
>> --- a/meta/recipes-devtools/perl/perl-native_5.14.2.bb
>> +++ b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
>> @@ -4,7 +4,7 @@ SECTION = "libs"
>>  LICENSE = "Artistic-1.0 | GPL-1.0"
>>  LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>>                    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
>> -PR = "r0"
>> +PR = "r1"
>>
>>  LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>>                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
>> @@ -14,7 +14,8 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
>>            file://perl-configpm-switch.patch \
>>            file://native-nopacklist.patch \
>>            file://native-perlinc.patch \
>> -           file://MM_Unix.pm.patch"
>> +           file://MM_Unix.pm.patch \
>> +           file://perl-build-in-t-dir.patch"
>>
>>  SRC_URI[md5sum] = "3306fbaf976dcebdcd49b2ac0be00eb9"
>>  SRC_URI[sha256sum] = "6488359573bd7d41761bf935f66f827dc220fb3df961ef9b775d51fbd66548d3"
>> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
>> index 809fc72..2452a44 100644
>> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>>  # We need gnugrep (for -I)
>>  DEPENDS = "virtual/db grep-native"
>>  DEPENDS += "gdbm zlib"
>> -PR = "r6"
>> +PR = "r7"
>>
>>  # 5.10.1 has Module::Build built-in
>>  PROVIDES += "libmodule-build-perl"
>> @@ -65,6 +65,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
>>         file://perl-enable-gdbm.patch \
>>         file://cross-generate_uudmap.patch \
>>        file://fix_bad_rpath.patch \
>> +       file://perl-build-in-t-dir.patch \
>>        \
>>         file://config.sh \
>>         file://config.sh-32 \
>> --
>> 1.7.10
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


