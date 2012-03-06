Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S4sQi-0001Fr-Q5
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 12:19:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q26BAv7n011945
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Mar 2012 03:10:57 -0800 (PST)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 6 Mar 2012 03:10:57 -0800
Message-ID: <4F55F0C4.3040002@windriver.com>
Date: Tue, 6 Mar 2012 19:11:00 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1330771239.git.xiaofeng.yan@windriver.com>
	<6b45ee6d33a54d9abcbc0dd28f383a4993795017.1330771239.git.xiaofeng.yan@windriver.com>
	<4F553BB5.9040405@linux.intel.com>
In-Reply-To: <4F553BB5.9040405@linux.intel.com>
X-Originating-IP: [128.224.162.223]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] archiver_configure.bbclass: configure the content for archiving package
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
X-List-Received-Date: Tue, 06 Mar 2012 11:19:45 -0000
Content-Type: multipart/alternative;
	boundary="------------070406090101090901050900"

--------------070406090101090901050900
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2012?03?06? 06:18, Saul Wold wrote:
> On 03/03/2012 02:54 AM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> This is configuration file to point to what content a archive package
>> should include in the different stage of task by pointing to 
>> different variable and
>> stage.
>>
> Xiaogeng,
>
> You are on the right path with this one, but what was originally 
> talked about was having multiple archiver bbclasses that did the 
> configuration and set when the archive would take place.
>
> Than one could just inherit the bbclass that matches their needs, so 
> there should be a bbclass that's equivalent to the current copyleft 
> bbclass. And as we defined in earlier emails the 3-4 archives, we 
> should have matching bbclasses for those.
>
Thanks for your reply.
> 1) Original Source & Patches w/ Series file & other files
This needs two bbclass named for 
"tar_original_source_patch_serires_scripts_logs.bblcass" and 
"srpm_original_source_patch_serires_scripts_logs.bblcass". 
archiver.bbclass should be inherited in two bbclass.

"scripts" include .bb and .inc files.
"logs" include temp.
I take zlib for an example with tar type:
step 1: inherit tar_original_source_patch_serires_scripts_logs in 
pakcage_rpm.bbclass.
step 2:
/$bitbake zlib/
step 3:
/$ ls  tmp/deploy/sources/i586-poky-linux/Zlib/zlib-1.2.6-r1/
zlib-1.2.6-r1-patches.tar.gz  zlib-1.2.6-r1-prepatch.tar.gz  
zlib-1.2.6-r1-script-logs.tar.gz/

I organize the directory to deploy archiving package with the following 
mode.
tar_sources = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys + 
'/' + licenses + '/' + pf
here:

target_sys is  i586-poky-linux
Zlib is license of package zlib
pf is "zlib-1.2.6-r1"
//zlib-1.2.6-r1-prepatch.tar.gz  include original sources
zlib-1.2.6-r1-patches.tar.gz include patches and series
zlib-1.2.6-r1-script-logs.tar.gz include temp with .bb and .inc files
/
/if we want to get srpm package. we should inherit 
srpm_original_source_patch_serires_scripts_logs.bblcass in 
package_rpm.bbclass
$bitbake zlib
$ls /tmp/deploy/sources/deploy-srpm/i586/Zlib//
zlib-1.2.6-r1.src.rpm
/
/
> 2) Patched & Configured Source & temp dir
This needs four bbclass
tar_patched_sources_logs.bbclass
tar_configured_sources_logs.bbclass
srpm_patched_sources_logs.bbclass
srpm_configured_sources_logs.bbclass

> 3) Copyleft Equivlant (so we can remove that class also)
I only inherit this class in archiver.bbclass in V1 without merging it 
to archiver.bbclass.  I can merge this class if you want.

  I think we can define some variables like SOURCE_ARCHIVE_PACKAGE_TYPE 
= {'tar','srpm'} and SOURCE_ARCHIVE_LOGS_WITH_SCRIPTS = 'True'
SOURCE_ARCHIVE_LOGS = 'True' in conf/local.conf to reduce the number of 
archive bbclass.

I will send you the V2 according to your reply.
**
I do apologize about my design can't meet your requirement.
>
> Sau!
>
>
>> [YOCTO #1977]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>>   meta/classes/archiver_configure.bbclass |   35 
>> +++++++++++++++++++++++++++++++
>>   1 files changed, 35 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/classes/archiver_configure.bbclass
>>
>> diff --git a/meta/classes/archiver_configure.bbclass 
>> b/meta/classes/archiver_configure.bbclass
>> new file mode 100644
>> index 0000000..c9892d3
>> --- /dev/null
>> +++ b/meta/classes/archiver_configure.bbclass
>> @@ -0,0 +1,35 @@
>> +# This file is for getting tarball in different stage for sources, 
>> patches, and logs by configuring
>> +# the following variable and tasks
>> +
>> +inherit archiver
>> +
>> +# SOURCE_ARCHIVE_PACKAGE_TYPE = {'tar','srpm'}
>> +SOURCE_ARCHIVE_PACKAGE_TYPE = 'tar'
>> +
>> +# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS = {'logs_with_scripts', 'logs'}
>> +# String 'logs_with_scripts' include temp directory and .bb and .inc 
>> file
>> +# String 'logs' only include temp
>> +SOURCE_ARCHIVE_LOG_WITH_SCRIPTS = 'logs_with_scripts'
>> +
>> +# PATCHES_ARCHIVE_WITH_SERIES = {'true', 'false'}
>> +# Strings 'true' means that patches including series files(series + 
>> non-applying)
>> +# String 'false' means that no series and only archive applying patches
>> +PATCHES_ARCHIVE_WITH_SERIES = 'true'
>> +
>> +# Archive packages for copy-left
>> +#COPYLEFT_COMPLIANCE = 'true'
>> +
>> +# Open this item when you want to get original sources tarball with 
>> patches
>> +do_unpack[postfuncs] += "do_archive_original_sources_patches "
>> +
>> +# Open this item when you want to get tarball for patched sources 
>> including patches
>> +#do_patch[postfuncs] += "do_archive_patched_sources "
>> +
>> +# Open this item when you want to get tarball for configured sources 
>> including patches
>> +#do_configure[postfuncs] += "do_archive_configured_sources "
>> +
>> +# Open this item when you want to get tarball for logs tarball
>> +do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
>> +
>> +# Get dump date and create diff file
>> +do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
>


--------------070406090101090901050900
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    On 2012&#24180;03&#26376;06&#26085; 06:18, Saul Wold wrote:
    <blockquote cite="mid:4F553BB5.9040405@linux.intel.com" type="cite">On
      03/03/2012 02:54 AM, Xiaofeng Yan wrote:
      <br>
      <blockquote type="cite">From: Xiaofeng
        Yan<a class="moz-txt-link-rfc2396E" href="mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>
        <br>
        <br>
        This is configuration file to point to what content a archive
        package
        <br>
        should include in the different stage of task by pointing to
        different variable and
        <br>
        stage.
        <br>
        <br>
      </blockquote>
      Xiaogeng,
      <br>
      <br>
      You are on the right path with this one, but what was originally
      talked about was having multiple archiver bbclasses that did the
      configuration and set when the archive would take place.
      <br>
      <br>
      Than one could just inherit the bbclass that matches their needs,
      so there should be a bbclass that's equivalent to the current
      copyleft bbclass. And as we defined in earlier emails the 3-4
      archives, we should have matching bbclasses for those.
      <br>
      <br>
    </blockquote>
    Thanks for your reply. <br>
    <blockquote cite="mid:4F553BB5.9040405@linux.intel.com" type="cite">1)
      Original Source &amp; Patches w/ Series file &amp; other files
      <br>
    </blockquote>
    This needs two bbclass named for
    "tar_original_source_patch_serires_scripts_logs.bblcass" and
    "srpm_original_source_patch_serires_scripts_logs.bblcass".
    archiver.bbclass should be inherited in two bbclass.<br>
    <br>
    "scripts" include .bb and .inc files.<br>
    "logs" include temp.<br>
    I take zlib for an example with tar type:<br>
    step 1: inherit tar_original_source_patch_serires_scripts_logs in
    pakcage_rpm.bbclass. <br>
    step 2:<br>
    <i>$bitbake zlib</i><br>
    step 3:<br>
    <i>$ ls&nbsp; tmp/deploy/sources/i586-poky-linux/<font color="#cc0000">Zlib</font>/zlib-1.2.6-r1/<br>
      <font color="#3333ff">zlib-1.2.6-r1-patches.tar.gz&nbsp;
        zlib-1.2.6-r1-prepatch.tar.gz&nbsp; zlib-1.2.6-r1-script-logs.tar.gz</font></i><br>
    <br>
    I <span class="label_list">organize the</span> directory to deploy
    archiving package with the following mode.<br>
    tar_sources = d.getVar('DEPLOY_DIR', True) + '/sources/' +
    target_sys + '/' + licenses + '/' + pf<br>
    here:<br>
    <br>
    target_sys is&nbsp; i586-poky-linux<br>
    <font color="#cc0000">Zlib</font> is license of package zlib<br>
    pf is "zlib-1.2.6-r1"<br>
    <i><font color="#3333ff"> </font></i><font color="#3333ff"><font
        color="#000000">zlib-1.2.6-r1-prepatch.tar.gz</font></font><font
      color="#000000">&nbsp; include original sources<br>
      zlib-1.2.6-r1-patches.tar.gz include patches and series <br>
    </font><font color="#3333ff"><font color="#000000">zlib-1.2.6-r1-script-logs.tar.gz
        include temp with .bb and .inc files<br>
      </font></font><i><font color="#3333ff"><br>
      </font></i><font color="#3333ff"><font color="#000000">if we want
        to get srpm package. we should inherit </font></font>srpm_original_source_patch_serires_scripts_logs.bblcass
    in package_rpm.bbclass<br>
    $bitbake zlib <br>
    $ls <i>tmp/deploy/sources/deploy-srpm/i586/Zlib/</i><br>
    zlib-1.2.6-r1.src.rpm<br>
    <i><font color="#3333ff"><br>
      </font></i>
    <blockquote cite="mid:4F553BB5.9040405@linux.intel.com" type="cite">2)
      Patched &amp; Configured Source &amp; temp dir
      <br>
    </blockquote>
    This needs four bbclass <br>
    tar_patched_sources_logs.bbclass<br>
    tar_configured_sources_logs.bbclass<br>
    srpm_patched_sources_logs.bbclass<br>
    srpm_configured_sources_logs.bbclass<br>
    <br>
    <blockquote cite="mid:4F553BB5.9040405@linux.intel.com" type="cite">3)
      Copyleft Equivlant (so we can remove that class also)
      <br>
    </blockquote>
    I only inherit this class in archiver.bbclass in V1 without merging
    it to archiver.bbclass.&nbsp; I can merge this class if you want.&nbsp; <br>
    <br>
    &nbsp;I think we can define some variables like
    SOURCE_ARCHIVE_PACKAGE_TYPE = {'tar','srpm'} and
    SOURCE_ARCHIVE_LOGS_WITH_SCRIPTS = 'True'<br>
    SOURCE_ARCHIVE_LOGS = 'True' in conf/local.conf to reduce the number
    of archive bbclass. <br>
    <br>
    I will send you the V2 according to your reply.<br>
    <b> </b><br>
    I do apologize about my design can't meet your requirement. &nbsp; <br>
    <blockquote cite="mid:4F553BB5.9040405@linux.intel.com" type="cite">
      <br>
      Sau!
      <br>
      <br>
      <br>
      <blockquote type="cite">[YOCTO #1977]
        <br>
        <br>
        Signed-off-by: Xiaofeng Yan<a class="moz-txt-link-rfc2396E" href="mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>
        <br>
        <br>
        Signed-off-by: Xiaofeng Yan<a class="moz-txt-link-rfc2396E" href="mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; meta/classes/archiver_configure.bbclass |&nbsp;&nbsp; 35
        +++++++++++++++++++++++++++++++
        <br>
        &nbsp; 1 files changed, 35 insertions(+), 0 deletions(-)
        <br>
        &nbsp; create mode 100644 meta/classes/archiver_configure.bbclass
        <br>
        <br>
        diff --git a/meta/classes/archiver_configure.bbclass
        b/meta/classes/archiver_configure.bbclass
        <br>
        new file mode 100644
        <br>
        index 0000000..c9892d3
        <br>
        --- /dev/null
        <br>
        +++ b/meta/classes/archiver_configure.bbclass
        <br>
        @@ -0,0 +1,35 @@
        <br>
        +# This file is for getting tarball in different stage for
        sources, patches, and logs by configuring
        <br>
        +# the following variable and tasks
        <br>
        +
        <br>
        +inherit archiver
        <br>
        +
        <br>
        +# SOURCE_ARCHIVE_PACKAGE_TYPE = {'tar','srpm'}
        <br>
        +SOURCE_ARCHIVE_PACKAGE_TYPE = 'tar'
        <br>
        +
        <br>
        +# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS = {'logs_with_scripts',
        'logs'}
        <br>
        +# String 'logs_with_scripts' include temp directory and .bb and
        .inc file
        <br>
        +# String 'logs' only include temp
        <br>
        +SOURCE_ARCHIVE_LOG_WITH_SCRIPTS = 'logs_with_scripts'
        <br>
        +
        <br>
        +# PATCHES_ARCHIVE_WITH_SERIES = {'true', 'false'}
        <br>
        +# Strings 'true' means that patches including series
        files(series + non-applying)
        <br>
        +# String 'false' means that no series and only archive applying
        patches
        <br>
        +PATCHES_ARCHIVE_WITH_SERIES = 'true'
        <br>
        +
        <br>
        +# Archive packages for copy-left
        <br>
        +#COPYLEFT_COMPLIANCE = 'true'
        <br>
        +
        <br>
        +# Open this item when you want to get original sources tarball
        with patches
        <br>
        +do_unpack[postfuncs] += "do_archive_original_sources_patches "
        <br>
        +
        <br>
        +# Open this item when you want to get tarball for patched
        sources including patches
        <br>
        +#do_patch[postfuncs] += "do_archive_patched_sources "
        <br>
        +
        <br>
        +# Open this item when you want to get tarball for configured
        sources including patches
        <br>
        +#do_configure[postfuncs] += "do_archive_configured_sources "
        <br>
        +
        <br>
        +# Open this item when you want to get tarball for logs tarball
        <br>
        +do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
        <br>
        +
        <br>
        +# Get dump date and create diff file
        <br>
        +do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz
        "
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------070406090101090901050900--
