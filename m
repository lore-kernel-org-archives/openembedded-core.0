Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6657F376
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 19:47:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7NJkC0J024452
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2019 12:46:49 -0700
Received: from [128.224.56.218] (128.224.56.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 23 Aug 2019 12:46:17 -0700
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
References: <1565274408-17026-1-git-send-email-Trevor.Gamblin@windriver.com>
	<81291d61-6a10-620c-df84-5b3f066cca0e@windriver.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <0f2047b0-099a-7620-c7ac-bbd82a50c35f@windriver.com>
Date: Fri, 23 Aug 2019 15:46:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <81291d61-6a10-620c-df84-5b3f066cca0e@windriver.com>
Subject: Re: [warrior][PATCH v2] patch: fix CVE-2019-13638
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
X-List-Received-Date: Fri, 23 Aug 2019 19:47:15 -0000
Content-Type: multipart/alternative;
	boundary="------------5AD182AE06A9670506B76A7B"
Content-Language: en-US

--------------5AD182AE06A9670506B76A7B
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 8/8/19 4:16 PM, Randy MacLeod wrote:
> On 8/8/19 10:26 AM, Trevor Gamblin wrote:
>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   ...ke-ed-directly-instead-of-using-the-shell.patch | 44 
>> ++++++++++++++++++++++
>>   meta/recipes-devtools/patch/patch_2.7.6.bb         |  2 +
>>   2 files changed, 46 insertions(+)
>>   create mode 100644 
>> meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
>>
>> diff --git 
>> a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch 
>> b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch 
>>
>> new file mode 100644
>> index 0000000..f60dfe8
>> --- /dev/null
>> +++ 
>> b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
>> @@ -0,0 +1,44 @@
>> +From 3fcd042d26d70856e826a42b5f93dc4854d80bf0 Mon Sep 17 00:00:00 2001
>> +From: Andreas Gruenbacher <agruen@gnu.org>
>> +Date: Fri, 6 Apr 2018 19:36:15 +0200
>> +Subject: [PATCH] Invoke ed directly instead of using the shell
>> +
>> +* src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
>> +command to avoid quoting vulnerabilities.
>> +
>> +CVE: CVE-2019-13638
>> +Upstream-Status: 
>> Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
>> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> +
>> +---
>> + src/pch.c | 6 ++----
>> + 1 file changed, 2 insertions(+), 4 deletions(-)
>> +
>> +
>> +diff --git a/src/pch.c b/src/pch.c
>> +index 4fd5a05..16e001a 100644
>> +--- a/src/pch.c
>> ++++ b/src/pch.c
>> +@@ -2459,9 +2459,6 @@ do_ed_script (char const *inname, char const 
>> *outname,
>> +         *outname_needs_removal = true;
>> +         copy_file (inname, outname, 0, exclusive, instat.st_mode, 
>> true);
>> +       }
>> +-    sprintf (buf, "%s %s%s", editor_program,
>> +-         verbosity == VERBOSE ? "" : "- ",
>> +-         outname);
>> +     fflush (stdout);
>> +
>> +     pid = fork();
>> +@@ -2470,7 +2467,8 @@ do_ed_script (char const *inname, char const 
>> *outname,
>> +     else if (pid == 0)
>> +       {
>> +         dup2 (tmpfd, 0);
>> +-        execl ("/bin/sh", "sh", "-c", buf, (char *) 0);
>> ++        assert (outname[0] != '!' && outname[0] != '-');
>> ++        execlp (editor_program, editor_program, "-", outname, 
>> (char  *) NULL);
>> +         _exit (2);
>> +       }
>> +     else
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb 
>> b/meta/recipes-devtools/patch/patch_2.7.6.bb
>> index 85b0db7..8908910 100644
>> --- a/meta/recipes-devtools/patch/patch_2.7.6.bb
>> +++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
>> @@ -6,6 +6,8 @@ SRC_URI += 
>> "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
>> file://0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch \
>> file://0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch \
>> file://0001-Fix-swapping-fake-lines-in-pch_swap.patch \
>> +            file://CVE-2019-13636.patch \
>> + file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch \
>>   "
>
> Odd, you only added one patch but you changed two lines above.
> I assume this is due to a merge conflict that you incorrectly resolved.
>
> If you apply this commit on warrior, you see:
>
> WARNING: patch-2.7.6-r0 do_fetch: Failed to fetch URL 
> file://CVE-2019-13636.patch, attempting MIRRORS if available
> ERROR: patch-2.7.6-r0 do_fetch: Fetcher failure: Unable to find file 
> file://CVE-2019-13636.patch anywhere. The paths that were searched were:
>
> Fix and v3 please.

Patches are currently under review for both warrior 
<https://patchwork.openembedded.org/patch/163490/> and thud 
<https://patchwork.openembedded.org/patch/163495/> to add 
CVE-2019-13636. Would it be better to hold off on submitting my patch 
for CVE-2019-13638 to those branches, until the line

             file://CVE-2019-13636.patch \

is incorporated as part of those?

>
> ../Randy
>>     SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
>>
>
>

--------------5AD182AE06A9670506B76A7B
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/8/19 4:16 PM, Randy MacLeod wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:81291d61-6a10-620c-df84-5b3f066cca0e@windriver.com">On
      8/8/19 10:26 AM, Trevor Gamblin wrote:
      <br>
      <blockquote type="cite">From: Trevor Gamblin
        <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
        <br>
        <br>
        Signed-off-by: Trevor Gamblin
        <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
        <br>
        ---
        <br>
          ...ke-ed-directly-instead-of-using-the-shell.patch | 44
        ++++++++++++++++++++++
        <br>
          meta/recipes-devtools/patch/patch_2.7.6.bb         |  2 +
        <br>
          2 files changed, 46 insertions(+)
        <br>
          create mode 100644
meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch<br>
        <br>
        diff --git
a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
        <br>
        new file mode 100644
        <br>
        index 0000000..f60dfe8
        <br>
        --- /dev/null
        <br>
        +++
b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch<br>
        @@ -0,0 +1,44 @@
        <br>
        +From 3fcd042d26d70856e826a42b5f93dc4854d80bf0 Mon Sep 17
        00:00:00 2001
        <br>
        +From: Andreas Gruenbacher <a class="moz-txt-link-rfc2396E" href="mailto:agruen@gnu.org">&lt;agruen@gnu.org&gt;</a>
        <br>
        +Date: Fri, 6 Apr 2018 19:36:15 +0200
        <br>
        +Subject: [PATCH] Invoke ed directly instead of using the shell
        <br>
        +
        <br>
        +* src/pch.c (do_ed_script): Invoke ed directly instead of using
        a shell
        <br>
        +command to avoid quoting vulnerabilities.
        <br>
        +
        <br>
        +CVE: CVE-2019-13638
        <br>
        +Upstream-Status:
Backport[<a class="moz-txt-link-freetext" href="https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0">https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0</a>]<br>
        +Signed-off-by: Trevor Gamblin
        <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
        <br>
        +
        <br>
        +---
        <br>
        + src/pch.c | 6 ++----
        <br>
        + 1 file changed, 2 insertions(+), 4 deletions(-)
        <br>
        +
        <br>
        +
        <br>
        +diff --git a/src/pch.c b/src/pch.c
        <br>
        +index 4fd5a05..16e001a 100644
        <br>
        +--- a/src/pch.c
        <br>
        ++++ b/src/pch.c
        <br>
        +@@ -2459,9 +2459,6 @@ do_ed_script (char const *inname, char
        const *outname,
        <br>
        +         *outname_needs_removal = true;
        <br>
        +         copy_file (inname, outname, 0, exclusive,
        instat.st_mode, true);
        <br>
        +       }
        <br>
        +-    sprintf (buf, "%s %s%s", editor_program,
        <br>
        +-         verbosity == VERBOSE ? "" : "- ",
        <br>
        +-         outname);
        <br>
        +     fflush (stdout);
        <br>
        +
        <br>
        +     pid = fork();
        <br>
        +@@ -2470,7 +2467,8 @@ do_ed_script (char const *inname, char
        const *outname,
        <br>
        +     else if (pid == 0)
        <br>
        +       {
        <br>
        +         dup2 (tmpfd, 0);
        <br>
        +-        execl ("/bin/sh", "sh", "-c", buf, (char *) 0);
        <br>
        ++        assert (outname[0] != '!' &amp;&amp; outname[0] !=
        '-');
        <br>
        ++        execlp (editor_program, editor_program, "-", outname,
        (char  *) NULL);
        <br>
        +         _exit (2);
        <br>
        +       }
        <br>
        +     else
        <br>
        +--
        <br>
        +2.7.4
        <br>
        +
        <br>
        diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb
        b/meta/recipes-devtools/patch/patch_2.7.6.bb
        <br>
        index 85b0db7..8908910 100644
        <br>
        --- a/meta/recipes-devtools/patch/patch_2.7.6.bb
        <br>
        +++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
        <br>
        @@ -6,6 +6,8 @@ SRC_URI +=
        "<a class="moz-txt-link-freetext" href="file://0001-Unset-need_charset_alias-when-building-for-musl.patch">file://0001-Unset-need_charset_alias-when-building-for-musl.patch</a>
        \
        <br>
                     
        <a class="moz-txt-link-freetext" href="file://0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch">file://0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch</a>
        \
        <br>
                     
        <a class="moz-txt-link-freetext" href="file://0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch">file://0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch</a>
        \
        <br>
                     
        <a class="moz-txt-link-freetext" href="file://0001-Fix-swapping-fake-lines-in-pch_swap.patch">file://0001-Fix-swapping-fake-lines-in-pch_swap.patch</a> \
        <br>
        +            <a class="moz-txt-link-freetext" href="file://CVE-2019-13636.patch">file://CVE-2019-13636.patch</a> \
        <br>
        +           
        <a class="moz-txt-link-freetext" href="file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch">file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch</a>
        \
        <br>
          "
        <br>
      </blockquote>
      <br>
      Odd, you only added one patch but you changed two lines above.
      <br>
      I assume this is due to a merge conflict that you incorrectly
      resolved.
      <br>
      <br>
      If you apply this commit on warrior, you see:
      <br>
      <br>
      WARNING: patch-2.7.6-r0 do_fetch: Failed to fetch URL
      <a class="moz-txt-link-freetext" href="file://CVE-2019-13636.patch">file://CVE-2019-13636.patch</a>, attempting MIRRORS if available
      <br>
      ERROR: patch-2.7.6-r0 do_fetch: Fetcher failure: Unable to find
      file <a class="moz-txt-link-freetext" href="file://CVE-2019-13636.patch">file://CVE-2019-13636.patch</a> anywhere. The paths that were
      searched were:
      <br>
      <br>
      Fix and v3 please.
      <br>
    </blockquote>
    <p>Patches are currently under review for both <a
        moz-do-not-send="true"
        href="https://patchwork.openembedded.org/patch/163490/">warrior</a>
      and <a moz-do-not-send="true"
        href="https://patchwork.openembedded.org/patch/163495/">thud</a>
      to add CVE-2019-13636. Would it be better to hold off on
      submitting my patch for CVE-2019-13638 to those branches, until
      the line</p>
    <p>            <a class="moz-txt-link-freetext" href="file://CVE-2019-13636.patch">file://CVE-2019-13636.patch</a> \ <br>
    </p>
    <p>is incorporated as part of those?<br>
    </p>
    <blockquote type="cite"
      cite="mid:81291d61-6a10-620c-df84-5b3f066cca0e@windriver.com">
      <br>
      ../Randy
      <br>
      <blockquote type="cite">    SRC_URI[md5sum] =
        "4c68cee989d83c87b00a3860bcd05600"
        <br>
        <br>
      </blockquote>
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------5AD182AE06A9670506B76A7B--
