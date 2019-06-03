Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 996AB7D9E5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 03:35:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x533ZNh2000824
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Jun 2019 20:35:23 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 2 Jun 2019 20:35:23 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
	<892252c3c1961d471cdf37c67a811353ab495e0b.1557628550.git.hongxu.jia@windriver.com>
	<CANNYZj88dNfVa1DfXPFuOSHbeZw8BBhh8qgycLPgf=MM7s7pDg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <c4d902bd-5850-9bca-2d9c-1fc655cdd665@windriver.com>
Date: Mon, 3 Jun 2019 11:35:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj88dNfVa1DfXPFuOSHbeZw8BBhh8qgycLPgf=MM7s7pDg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] ncurses: fix incorrect UPSTREAM_CHECK_GITTAGREGEX
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
X-List-Received-Date: Mon, 03 Jun 2019 03:35:24 -0000
Content-Type: multipart/alternative;
	boundary="------------F2312DE37925F13B2BEF704C"
Content-Language: en-US

--------------F2312DE37925F13B2BEF704C
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 6/1/19 4:27 AM, Alexander Kanavin wrote:
> On Sun, 12 May 2019 at 10:18, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     The upstream git tag has a `upstream/' prefix, such as:
>     >>> import re
>     >>> pattern = "upstream/(?P<pver>\d+(\.\d+)+(\+\d+)*)"
>     >>> string = "upstream/6.1+20181013"
>     >>> result = re.match(pattern, string)
>     >>> result['pver']
>     '6.1+20181013'
>
>
> Have you checked with devtool that this actually works?
>
I am afraid no, I did not run devtool it before


> Before this commit:
> alexander@alexander-box:~/development/poky$ devtool 
> check-upgrade-status ncurses
> INFO: ncurses                   6.1             6.1+20181013    Hongxu 
> Jia <hongxu.jia@windriver.com <mailto:hongxu.jia@windriver.com>> 
> 7a97a7f937762ba342d5b2fd7cd090885a809835
>
Then I know the script, and run it, I am afraid only revert is not 
sufficient.

The current ncurses version is `6.1+20181013' rather than `6.1', since 
upstream latest

version is `6.1+20181013', but auth email incorrect report ncurses 
should be upgraded

(that's why I try to fix UPSTREAM_CHECK_GITTAGREGEX, but it seems a 
wrong try)


Thanks to your mention of devtool, I know how auth works, and trace the 
root cause,

then I found in the following commit, it filters out `+' from git pv, 
but in ncurse case,

`+' is part of version

...

commit ab609c471d85be3248b789c8ab2813957cd97e29
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Mon Aug 3 19:29:54 2015 +0300

     recipeutils.py: allow all characters in regexes used to parse 
version strings

     Previously only numeric characters were matches and anything else was
     discarded, so 4.0-rc3, 2005e, 1.0.2a and similar versions got 
truncated.

     Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 9d45b42..cd74213 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -638,7 +638,7 @@ def get_recipe_pv_without_srcpv(pv, uri_type):
      sfx = ''

      if uri_type == 'git':
-        git_regex = 
re.compile("(?P<pfx>(v|))(?P<ver>((\d+[\.\-_]*)+))(?P<sfx>(\+|)(git|)(r|)(AUTOINC|)(\+|))(?P<rev>.*)")
+        git_regex = 
re.compile("(?P<pfx>v?)(?P<ver>[^\+]*)((?P<sfx>\+(git)?r?(AUTOINC\+))(?P<rev>.*))?")
          m = git_regex.match(pv)

          if m:

...

I believe the commit is to parse manually  PV in **_git.bb (such as `PV 
= "1.9.0+git${SRCPV}"' ),

which contains `+gitAUTOINC+' in PV, but the regrex is not suitable for 
ncurses version


//Hongxu


> After the commit:
> alexander@alexander-box:~/development/poky$ devtool 
> check-upgrade-status ncurses
> INFO: ncurses                   6.1 UNKNOWN_BROKEN  Hongxu Jia 
> <hongxu.jia@windriver.com <mailto:hongxu.jia@windriver.com>>
>
> The code in bitbake/lib/bb/fetch2/git.py actually splits each tag with 
> '/' as separator and takes only the last part for some reason, so 
> those prefixes are never a part of the string that is matched against 
> regex.
> I'll send a revert in a moment.
>
> Alex
>
>


--------------F2312DE37925F13B2BEF704C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 6/1/19 4:27 AM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj88dNfVa1DfXPFuOSHbeZw8BBhh8qgycLPgf=MM7s7pDg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Sun, 12 May 2019 at
            10:18, Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">The upstream git tag has
            a `upstream/' prefix, such as:<br>
            &gt;&gt;&gt; import re<br>
            &gt;&gt;&gt; pattern =
            "upstream/(?P&lt;pver&gt;\d+(\.\d+)+(\+\d+)*)"<br>
            &gt;&gt;&gt; string = "upstream/6.1+20181013"<br>
            &gt;&gt;&gt; result = re.match(pattern, string)<br>
            &gt;&gt;&gt; result['pver']<br>
            '6.1+20181013'<br>
          </blockquote>
          <div><br>
          </div>
          <div>Have you checked with devtool that this actually works?</div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I am afraid no, I did not run devtool it before</p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj88dNfVa1DfXPFuOSHbeZw8BBhh8qgycLPgf=MM7s7pDg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> Before this commit:</div>
          <div>alexander@alexander-box:~/development/poky$ devtool
            check-upgrade-status ncurses<br>
            INFO: ncurses                   6.1             6.1+20181013
               Hongxu Jia &lt;<a href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;
            7a97a7f937762ba342d5b2fd7cd090885a809835</div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Then I know the script, and run it, I am afraid only revert is
      not sufficient.</p>
    <p>The current ncurses version is `6.1+20181013' rather than `6.1',
      since upstream latest</p>
    <p>version is `6.1+20181013', but auth email incorrect report
      ncurses should be upgraded</p>
    <p>(that's why I try to fix UPSTREAM_CHECK_GITTAGREGEX, but it seems
      a wrong try)</p>
    <p><br>
    </p>
    <p>Thanks to your mention of devtool, I know how auth works, and
      trace the root cause,</p>
    <p>then I found in the following commit, it filters out `+' from git
      pv, but in ncurse case,</p>
    <p>`+' is part of version<br>
    </p>
    <p>...<br>
    </p>
    <p>commit ab609c471d85be3248b789c8ab2813957cd97e29<br>
      Author: Alexander Kanavin
      <a class="moz-txt-link-rfc2396E" href="mailto:alexander.kanavin@linux.intel.com">&lt;alexander.kanavin@linux.intel.com&gt;</a><br>
      Date:   Mon Aug 3 19:29:54 2015 +0300<br>
      <br>
          recipeutils.py: allow all characters in regexes used to parse
      version strings<br>
          <br>
          Previously only numeric characters were matches and anything
      else was<br>
          discarded, so 4.0-rc3, 2005e, 1.0.2a and similar versions got
      truncated.<br>
          <br>
          Signed-off-by: Alexander Kanavin
      <a class="moz-txt-link-rfc2396E" href="mailto:alexander.kanavin@linux.intel.com">&lt;alexander.kanavin@linux.intel.com&gt;</a><br>
          Signed-off-by: Richard Purdie
      <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
      <br>
      diff --git a/meta/lib/oe/recipeutils.py
      b/meta/lib/oe/recipeutils.py<br>
      index 9d45b42..cd74213 100644<br>
      --- a/meta/lib/oe/recipeutils.py<br>
      +++ b/meta/lib/oe/recipeutils.py<br>
      @@ -638,7 +638,7 @@ def get_recipe_pv_without_srcpv(pv, uri_type):<br>
           sfx = ''<br>
       <br>
           if uri_type == 'git':<br>
      -        git_regex =
re.compile("(?P&lt;pfx&gt;(v|))(?P&lt;ver&gt;((\d+[\.\-_]*)+))(?P&lt;sfx&gt;(\+|)(git|)(r|)(AUTOINC|)(\+|))(?P&lt;rev&gt;.*)")<br>
      +        git_regex =
re.compile("(?P&lt;pfx&gt;v?)(?P&lt;ver&gt;[^\+]*)((?P&lt;sfx&gt;\+(git)?r?(AUTOINC\+))(?P&lt;rev&gt;.*))?")<br>
               m = git_regex.match(pv)<br>
       <br>
               if m:<br>
    </p>
    <p>...</p>
    <p>I believe the commit is to parse manually  PV in **_git.bb (such
      as `PV = "1.9.0+git${SRCPV}"' ),</p>
    <p>which contains `+gitAUTOINC+' in PV, but the regrex is not
      suitable for ncurses version</p>
    <p><br>
    </p>
    <p>//Hongxu<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj88dNfVa1DfXPFuOSHbeZw8BBhh8qgycLPgf=MM7s7pDg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>After the commit:<br>
          </div>
          <div>alexander@alexander-box:~/development/poky$ devtool
            check-upgrade-status ncurses</div>
          <div>INFO: ncurses                   6.1            
            UNKNOWN_BROKEN  Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;  <br>
          </div>
          <div><br>
          </div>
          <div>The code in bitbake/lib/bb/fetch2/git.py actually splits
            each tag with '/' as separator and takes only the last part
            for some reason, so those prefixes are never a part of the
            string that is matched against regex.<br>
          </div>
          <div>I'll send a revert in a moment.</div>
          <div><br>
          </div>
          <div>Alex<br>
          </div>
          <div><br>
          </div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------F2312DE37925F13B2BEF704C--
