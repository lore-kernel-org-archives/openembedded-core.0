Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T9v2u-0006Mh-SZ
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 11:40:17 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Sep 2012 02:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,384,1344236400"; d="scan'208";a="142529919"
Received: from costin-desktop (HELO [10.237.105.156]) ([10.237.105.156])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2012 02:27:49 -0700
Message-ID: <5049B13B.80809@intel.com>
Date: Fri, 07 Sep 2012 11:32:59 +0300
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1346924974-13859-1-git-send-email-constantinx.musca@intel.com>
	<5048F04B.7000604@linux.intel.com>
In-Reply-To: <5048F04B.7000604@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] automake 1.12.3: fix warnings
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
X-List-Received-Date: Fri, 07 Sep 2012 09:40:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2012 09:49 PM, Saul Wold wrote:
> On 09/06/2012 02:49 AM, Constantin Musca wrote:
>> - don't fail when an autoconf tool tries to pass "--warning=cross"
>> to automake
>> - don't show a warning when the configure.in file exists
>>
>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> ---
>>   .../automake/automake/add-cross-warning.patch      |   91 
>> ++++++++++++++++++++
>>   .../automake/automake/no-configure.in-warn.patch   |   19 ++++
>>   meta/recipes-devtools/automake/automake_1.12.3.bb  |    2 +
>>   3 files changed, 112 insertions(+)
>>   create mode 100644 
>> meta/recipes-devtools/automake/automake/add-cross-warning.patch
>>   create mode 100644 
>> meta/recipes-devtools/automake/automake/no-configure.in-warn.patch
>>
>> diff --git 
>> a/meta/recipes-devtools/automake/automake/add-cross-warning.patch 
>> b/meta/recipes-devtools/automake/automake/add-cross-warning.patch
>> new file mode 100644
>> index 0000000..db0871e
>> --- /dev/null
>> +++ b/meta/recipes-devtools/automake/automake/add-cross-warning.patch
>> @@ -0,0 +1,91 @@
>> +Add cross compilation warning option
>> +
> While the below patch is one solution, maybe it would be better to see 
> how it's getting called and fix it at the caller level (autoconf?)
>
> I assigned a bug to you that address this.
I have sent an autoconf patch which solves the problem. ( [PATCH] 
autoconf: use --warning=cross only if supported ).

>
>
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> +
>> +--- a/aclocal.in
>> ++++ b/aclocal.in
>> +@@ -942,6 +942,7 @@ Options:
>> +   -W, --warnings=CATEGORY   report the warnings falling in CATEGORY
>> +
>> + Warning categories include:
>> ++  cross         cross compilation issues
>> +   syntax        dubious syntactic constructs (default)
>> +   unsupported   unknown macros (default)
>> +   all           all the warnings (default)
>> +--- a/doc/automake.info-1
>> ++++ b/doc/automake.info-1
>> +@@ -2291,6 +2291,9 @@ misunderstand this paragraph: `automake'
>> +           extra portability issues related to obscure tools. One
>> +           example of such a tool is the Microsoft `lib' archiver.
>> +
>> ++    `cross'
>> ++          cross compilation issues
>> ++
>> +     `syntax'
>> +           weird syntax, unused variables, typos
>> +
>> +@@ -2821,6 +2824,9 @@ File: automake.info,  Node: aclocal Opti
>> +
>> + `--warnings=CATEGORY'
>> +      Output warnings falling in CATEGORY.  CATEGORY can be one of:
>> ++    `cross'
>> ++          cross compilation issues
>> ++
>> +     `syntax'
>> +           dubious syntactic constructs, underquoted macros, unused
>> +           macros, etc.
>> +--- a/lib/Automake/ChannelDefs.pm
>> ++++ b/lib/Automake/ChannelDefs.pm
>> +@@ -97,6 +97,10 @@ Errors related to GNITS Standards (silen
>> +
>> + Internal errors.  Use C<&prog_error> to send messages over this 
>> channel.
>> +
>> ++=item C<cross>
>> ++
>> ++cross compilation issues
>> ++
>> + =item C<gnu>
>> +
>> + Warnings related to GNU Coding Standards.
>> +@@ -155,6 +159,7 @@ register_channel 'automake', type => 'fa
>> +   uniq_part => UP_NONE, ordered => 0;
>> +
>> + register_channel 'extra-portability', type => 'warning', silent => 1;
>> ++register_channel 'cross', type => 'warning';
>> + register_channel 'gnu', type => 'warning';
>> + register_channel 'obsolete', type => 'warning', silent => 1;
>> + register_channel 'override', type => 'warning', silent => 1;
>> +@@ -185,6 +190,7 @@ sub usage ()
>> + {
>> +   print <<EOF;
>> + Warning categories include:
>> ++  cross              cross compilation issues
>> +   gnu                GNU coding standards (default in gnu and gnits 
>> modes)
>> +   obsolete           obsolete features or constructions
>> +   override           user redefinitions of Automake rules or variables
>> +@@ -273,7 +279,11 @@ sub switch_warning ($)
>> +       $has_no = 1;
>> +     }
>> +
>> +-  if ($cat eq 'all')
>> ++  if ($cat eq 'cross')
>> ++    {
>> ++      setup_channel_type 'warning', silent => $has_no;
>> ++    }
>> ++  elsif ($cat eq 'all')
>> +     {
>> +       setup_channel_type 'warning', silent => $has_no;
>> +     }
>> +--- a/doc/automake.texi
>> ++++ b/doc/automake.texi
>> +@@ -2681,6 +2681,8 @@ Print the version number of Automake and
>> + Output warnings falling in @var{category}.  @var{category} can be
>> + one of:
>> + @table @code
>> ++@item cross
>> ++warnings related to cross compilation issues
>> + @item gnu
>> + warnings related to the GNU Coding Standards
>> + (@pxref{Top, , , standards, The GNU Coding Standards}).
>> diff --git 
>> a/meta/recipes-devtools/automake/automake/no-configure.in-warn.patch 
>> b/meta/recipes-devtools/automake/automake/no-configure.in-warn.patch
>> new file mode 100644
>> index 0000000..46329a5
>> --- /dev/null
>> +++ b/meta/recipes-devtools/automake/automake/no-configure.in-warn.patch
>> @@ -0,0 +1,19 @@
>> +Don't show a warning if configure.in exists
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> +
>> +--- a/lib/Automake/Configure_ac.pm
>> ++++ b/lib/Automake/Configure_ac.pm
>> +@@ -77,8 +77,8 @@ sub find_configure_ac (;@)
>> +
>> +   if (-f $configure_in)
>> +     {
>> +-      msg ('obsolete', "autoconf input should be named 
>> 'configure.ac'," .
>> +-                       " not 'configure.in'");
>> ++#      msg ('obsolete', "autoconf input should be named 
>> 'configure.ac'," .
>> ++#                       " not 'configure.in'");
>
> I think this is an important warning.
>
> I am not sure about this change, where is it occuring from?  It might 
> be better to fix the packages that use configure.in for automake 
> instead of working around this.
There was a problem with foxtrotgps, but Martin Jansa sent a patch to 
fix it. (http://patchwork.openembedded.org/patch/35989/).

>
>> +       if (-f $configure_ac)
>> +     {
>> +       msg ('unsupported',
>> diff --git a/meta/recipes-devtools/automake/automake_1.12.3.bb 
>> b/meta/recipes-devtools/automake/automake_1.12.3.bb
>> index 25069d7..c10adaf 100644
>> --- a/meta/recipes-devtools/automake/automake_1.12.3.bb
>> +++ b/meta/recipes-devtools/automake/automake_1.12.3.bb
>> @@ -37,6 +37,8 @@ PATHFIXPATCH_virtclass-nativesdk = ""
>>   SRC_URI += "${PATHFIXPATCH} \
>>           file://prefer-cpio-over-pax-for-ustar-archives.patch \
>>           file://python-libdir.patch \
>> +        file://add-cross-warning.patch \
>> +        file://no-configure.in-warn.patch \
>> file://py-compile-compile-only-optimized-byte-code.patch"
>>
>>   SRC_URI[md5sum] = "d2af8484de94cdee16d89c50aaa1c729"
>>



