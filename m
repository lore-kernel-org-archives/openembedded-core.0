Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C448F755F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 10:12:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9SACIUO017295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Oct 2015 03:12:19 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 28 Oct 2015 03:12:18 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1446009435.git.kai.kang@windriver.com>
	<484dd4883f19d258e29e343f1b0735d2940d7424.1446009435.git.kai.kang@windriver.com>
	<CAHiDW_EvNU3w7gKaz1N_=ZZU+wfGkf696i78TZf3-PZbGaRTrg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56309F82.203@windriver.com>
Date: Wed, 28 Oct 2015 18:12:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_EvNU3w7gKaz1N_=ZZU+wfGkf696i78TZf3-PZbGaRTrg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix unsafe memory access
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
X-List-Received-Date: Wed, 28 Oct 2015 10:12:25 -0000
Content-Type: multipart/alternative;
	boundary="------------090202090000080403090909"

--------------090202090000080403090909
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年10月28日 17:41, Jussi Kukkonen wrote:
>
>
> On 28 October 2015 at 07:22, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     Backport patch from:
>
>     https://bugzilla.gnome.org/show_bug.cgi?id=746048
>
>     to fix valgrind errors and unsafe memory access.
>
>     Fix the indentation by the way.
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>      .../libxml2/libxml2-fix-unsafe-memory-access.patch | 97
>     ++++++++++++++++++++++
>      meta/recipes-core/libxml/libxml2_2.9.2.bb
>     <http://libxml2_2.9.2.bb>          |  3 +-
>      2 files changed, 99 insertions(+), 1 deletion(-)
>      create mode 100644
>     meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch
>
>     diff --git
>     a/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch
>     b/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch
>     new file mode 100644
>     index 0000000..b583032
>     --- /dev/null
>     +++
>     b/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch
>     @@ -0,0 +1,97 @@
>     +Upstream-Status: Backport
>
>
> This may be a nitpick but I don't think DV has taken this patch in the 
> six months it's been available so it's not a backport.

I suppose Backport is the best choice in upstream status [ Pending 
Submitted Accepted Backport Denied Inappropriate ]. Though it is not 
from official upstream, it is from somewhere else as listed in the patch.

Thanks.

--Kai

>
>  - Jussi
>
>     +
>     +Backport from
>     +
>     +https://bugzilla.gnome.org/show_bug.cgi?id=746048
>     +
>     +to fix unsafe memory access.
>     +
>     +Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     +---
>     +diff --git a/HTMLparser.c b/HTMLparser.c
>     +index d329d3b..6f81424 100644
>     +--- a/HTMLparser.c
>     ++++ b/HTMLparser.c
>     +@@ -3245,13 +3245,20 @@ htmlParseComment(htmlParserCtxtPtr ctxt) {
>     +       ctxt->instate = state;
>     +       return;
>     +     }
>     ++    if ((ctxt->input->end - ctxt->input->cur) < 3) {
>     ++        ctxt->instate = XML_PARSER_EOF;
>     ++        htmlParseErr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,
>     ++                     "Comment not terminated\n", NULL, NULL);
>     ++        xmlFree(buf);
>     ++        return;
>     ++    }
>     +     q = CUR_CHAR(ql);
>     +     NEXTL(ql);
>     +     r = CUR_CHAR(rl);
>     +     NEXTL(rl);
>     +     cur = CUR_CHAR(l);
>     +     len = 0;
>     +-    while (IS_CHAR(cur) &&
>     ++    while (((ctxt->input->end - ctxt->input->cur) > 0) &&
>     IS_CHAR(cur) &&
>     +            ((cur != '>') ||
>     +           (r != '-') || (q != '-'))) {
>     +       if (len + 5 >= size) {
>     +@@ -3281,7 +3288,7 @@ htmlParseComment(htmlParserCtxtPtr ctxt) {
>     +       }
>     +     }
>     +     buf[len] = 0;
>     +-    if (!IS_CHAR(cur)) {
>     ++    if (!(ctxt->input->end - ctxt->input->cur) || !IS_CHAR(cur)) {
>     +       htmlParseErr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,
>     +                    "Comment not terminated \n<!--%.50s\n", buf,
>     NULL);
>     +       xmlFree(buf);
>     +@@ -4465,6 +4472,7 @@ htmlParseContentInternal(htmlParserCtxtPtr
>     ctxt) {
>     +     depth = ctxt->nameNr;
>     +     while (1) {
>     +       long cons = ctxt->nbChars;
>     ++    long rem = ctxt->input->end - ctxt->input->cur;
>     +
>     +         GROW;
>     +
>     +@@ -4540,7 +4548,7 @@ htmlParseContentInternal(htmlParserCtxtPtr
>     ctxt) {
>     +           /*
>     +            * Sometimes DOCTYPE arrives in the middle of the document
>     +            */
>     +-          if ((CUR == '<') && (NXT(1) == '!') &&
>     ++          if ((rem >= 9) && (CUR == '<') && (NXT(1) == '!') &&
>     +               (UPP(2) == 'D') && (UPP(3) == 'O') &&
>     +               (UPP(4) == 'C') && (UPP(5) == 'T') &&
>     +               (UPP(6) == 'Y') && (UPP(7) == 'P') &&
>     +@@ -4554,7 +4562,7 @@ htmlParseContentInternal(htmlParserCtxtPtr
>     ctxt) {
>     +           /*
>     +            * First case :  a comment
>     +            */
>     +-          if ((CUR == '<') && (NXT(1) == '!') &&
>     ++          if ((rem >= 4) && (CUR == '<') && (NXT(1) == '!') &&
>     +               (NXT(2) == '-') && (NXT(3) == '-')) {
>     +               htmlParseComment(ctxt);
>     +           }
>     +@@ -4562,14 +4570,14 @@
>     htmlParseContentInternal(htmlParserCtxtPtr ctxt) {
>     +           /*
>     +            * Second case : a Processing Instruction.
>     +            */
>     +-          else if ((CUR == '<') && (NXT(1) == '?')) {
>     ++          else if ((rem >= 2) && (CUR == '<') && (NXT(1) == '?')) {
>     +               htmlParsePI(ctxt);
>     +           }
>     +
>     +           /*
>     +            * Third case :  a sub-element.
>     +            */
>     +-          else if (CUR == '<') {
>     ++          else if ((rem >= 1) && (CUR == '<')) {
>     +               htmlParseElementInternal(ctxt);
>     +               if (currentNode != NULL) xmlFree(currentNode);
>     +
>     +@@ -4581,7 +4589,7 @@ htmlParseContentInternal(htmlParserCtxtPtr
>     ctxt) {
>     +            * Fourth case : a reference. If if has not been resolved,
>     +            *    parsing returns it's Name, create the node
>     +            */
>     +-          else if (CUR == '&') {
>     ++          else if ((rem >= 1) && (CUR == '&')) {
>     +               htmlParseReference(ctxt);
>     +           }
>     +
>     diff --git a/meta/recipes-core/libxml/libxml2_2.9.2.bb
>     <http://libxml2_2.9.2.bb>
>     b/meta/recipes-core/libxml/libxml2_2.9.2.bb <http://libxml2_2.9.2.bb>
>     index 79a395c..4cafc87 100644
>     --- a/meta/recipes-core/libxml/libxml2_2.9.2.bb
>     <http://libxml2_2.9.2.bb>
>     +++ b/meta/recipes-core/libxml/libxml2_2.9.2.bb
>     <http://libxml2_2.9.2.bb>
>     @@ -2,7 +2,8 @@ require libxml2.inc
>
>      SRC_URI +=
>     "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
>      file://72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch \
>     -
>      file://0001-threads-Define-pthread-definitions-for-glibc-complia.patch
>     \
>     +
>     file://0001-threads-Define-pthread-definitions-for-glibc-complia.patch
>     \
>     +            file://libxml2-fix-unsafe-memory-access.patch \
>                "
>
>      SRC_URI[libtar.md5sum] = "9e6a9aca9d155737868b3dc5fd82f788"
>     --
>     2.6.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
Regards,
Neil | Kai Kang


--------------090202090000080403090909
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2015年10月28日 17:41, Jussi Kukkonen
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHiDW_EvNU3w7gKaz1N_=ZZU+wfGkf696i78TZf3-PZbGaRTrg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 28 October 2015 at 07:22, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com" target="_blank">kai.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
              Kai Kang &lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt;<br>
              <br>
              Backport patch from:<br>
              <br>
              <a moz-do-not-send="true"
                href="https://bugzilla.gnome.org/show_bug.cgi?id=746048"
                rel="noreferrer" target="_blank">https://bugzilla.gnome.org/show_bug.cgi?id=746048</a><br>
              <br>
              to fix valgrind errors and unsafe memory access.<br>
              <br>
              Fix the indentation by the way.<br>
              <br>
              Signed-off-by: Kai Kang &lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt;<br>
              ---<br>
               .../libxml2/libxml2-fix-unsafe-memory-access.patch | 97
              ++++++++++++++++++++++<br>
               meta/recipes-core/libxml/<a moz-do-not-send="true"
                href="http://libxml2_2.9.2.bb" rel="noreferrer"
                target="_blank">libxml2_2.9.2.bb</a>          |  3 +-<br>
               2 files changed, 99 insertions(+), 1 deletion(-)<br>
               create mode 100644
              meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch<br>
              <br>
              diff --git
              a/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch
b/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch<br>
              new file mode 100644<br>
              index 0000000..b583032<br>
              --- /dev/null<br>
              +++
b/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch<br>
              @@ -0,0 +1,97 @@<br>
              +Upstream-Status: Backport<br>
            </blockquote>
            <div><br>
            </div>
            <div>This may be a nitpick but I don't think DV has taken
              this patch in the six months it's been available so it's
              not a backport.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I suppose Backport is the best choice in upstream status [ Pending
    Submitted Accepted Backport Denied Inappropriate ]. Though it is not
    from official upstream, it is from somewhere else as listed in the
    patch.<br>
    <br>
    Thanks.<br>
    <br>
    --Kai<br>
    <br>
    <blockquote
cite="mid:CAHiDW_EvNU3w7gKaz1N_=ZZU+wfGkf696i78TZf3-PZbGaRTrg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div> - Jussi </div>
            <div><br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">+<br>
              +Backport from<br>
              +<br>
              +<a moz-do-not-send="true"
                href="https://bugzilla.gnome.org/show_bug.cgi?id=746048"
                rel="noreferrer" target="_blank">https://bugzilla.gnome.org/show_bug.cgi?id=746048</a><br>
              +<br>
              +to fix unsafe memory access.<br>
              +<br>
              +Signed-off-by: Kai Kang &lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt;<br>
              +---<br>
              +diff --git a/HTMLparser.c b/HTMLparser.c<br>
              +index d329d3b..6f81424 100644<br>
              +--- a/HTMLparser.c<br>
              ++++ b/HTMLparser.c<br>
              +@@ -3245,13 +3245,20 @@
              htmlParseComment(htmlParserCtxtPtr ctxt) {<br>
              +       ctxt-&gt;instate = state;<br>
              +       return;<br>
              +     }<br>
              ++    if ((ctxt-&gt;input-&gt;end -
              ctxt-&gt;input-&gt;cur) &lt; 3) {<br>
              ++        ctxt-&gt;instate = XML_PARSER_EOF;<br>
              ++        htmlParseErr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,<br>
              ++                     "Comment not terminated\n", NULL,
              NULL);<br>
              ++        xmlFree(buf);<br>
              ++        return;<br>
              ++    }<br>
              +     q = CUR_CHAR(ql);<br>
              +     NEXTL(ql);<br>
              +     r = CUR_CHAR(rl);<br>
              +     NEXTL(rl);<br>
              +     cur = CUR_CHAR(l);<br>
              +     len = 0;<br>
              +-    while (IS_CHAR(cur) &amp;&amp;<br>
              ++    while (((ctxt-&gt;input-&gt;end -
              ctxt-&gt;input-&gt;cur) &gt; 0) &amp;&amp; IS_CHAR(cur)
              &amp;&amp;<br>
              +            ((cur != '&gt;') ||<br>
              +           (r != '-') || (q != '-'))) {<br>
              +       if (len + 5 &gt;= size) {<br>
              +@@ -3281,7 +3288,7 @@ htmlParseComment(htmlParserCtxtPtr
              ctxt) {<br>
              +       }<br>
              +     }<br>
              +     buf[len] = 0;<br>
              +-    if (!IS_CHAR(cur)) {<br>
              ++    if (!(ctxt-&gt;input-&gt;end -
              ctxt-&gt;input-&gt;cur) || !IS_CHAR(cur)) {<br>
              +       htmlParseErr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,<br>
              +                    "Comment not terminated
              \n&lt;!--%.50s\n", buf, NULL);<br>
              +       xmlFree(buf);<br>
              +@@ -4465,6 +4472,7 @@
              htmlParseContentInternal(htmlParserCtxtPtr ctxt) {<br>
              +     depth = ctxt-&gt;nameNr;<br>
              +     while (1) {<br>
              +       long cons = ctxt-&gt;nbChars;<br>
              ++    long rem = ctxt-&gt;input-&gt;end -
              ctxt-&gt;input-&gt;cur;<br>
              +<br>
              +         GROW;<br>
              +<br>
              +@@ -4540,7 +4548,7 @@
              htmlParseContentInternal(htmlParserCtxtPtr ctxt) {<br>
              +           /*<br>
              +            * Sometimes DOCTYPE arrives in the middle of
              the document<br>
              +            */<br>
              +-          if ((CUR == '&lt;') &amp;&amp; (NXT(1) == '!')
              &amp;&amp;<br>
              ++          if ((rem &gt;= 9) &amp;&amp; (CUR == '&lt;')
              &amp;&amp; (NXT(1) == '!') &amp;&amp;<br>
              +               (UPP(2) == 'D') &amp;&amp; (UPP(3) == 'O')
              &amp;&amp;<br>
              +               (UPP(4) == 'C') &amp;&amp; (UPP(5) == 'T')
              &amp;&amp;<br>
              +               (UPP(6) == 'Y') &amp;&amp; (UPP(7) == 'P')
              &amp;&amp;<br>
              +@@ -4554,7 +4562,7 @@
              htmlParseContentInternal(htmlParserCtxtPtr ctxt) {<br>
              +           /*<br>
              +            * First case :  a comment<br>
              +            */<br>
              +-          if ((CUR == '&lt;') &amp;&amp; (NXT(1) == '!')
              &amp;&amp;<br>
              ++          if ((rem &gt;= 4) &amp;&amp; (CUR == '&lt;')
              &amp;&amp; (NXT(1) == '!') &amp;&amp;<br>
              +               (NXT(2) == '-') &amp;&amp; (NXT(3) ==
              '-')) {<br>
              +               htmlParseComment(ctxt);<br>
              +           }<br>
              +@@ -4562,14 +4570,14 @@
              htmlParseContentInternal(htmlParserCtxtPtr ctxt) {<br>
              +           /*<br>
              +            * Second case : a Processing Instruction.<br>
              +            */<br>
              +-          else if ((CUR == '&lt;') &amp;&amp; (NXT(1) ==
              '?')) {<br>
              ++          else if ((rem &gt;= 2) &amp;&amp; (CUR ==
              '&lt;') &amp;&amp; (NXT(1) == '?')) {<br>
              +               htmlParsePI(ctxt);<br>
              +           }<br>
              +<br>
              +           /*<br>
              +            * Third case :  a sub-element.<br>
              +            */<br>
              +-          else if (CUR == '&lt;') {<br>
              ++          else if ((rem &gt;= 1) &amp;&amp; (CUR ==
              '&lt;')) {<br>
              +               htmlParseElementInternal(ctxt);<br>
              +               if (currentNode != NULL)
              xmlFree(currentNode);<br>
              +<br>
              +@@ -4581,7 +4589,7 @@
              htmlParseContentInternal(htmlParserCtxtPtr ctxt) {<br>
              +            * Fourth case : a reference. If if has not
              been resolved,<br>
              +            *    parsing returns it's Name, create the
              node<br>
              +            */<br>
              +-          else if (CUR == '&amp;') {<br>
              ++          else if ((rem &gt;= 1) &amp;&amp; (CUR ==
              '&amp;')) {<br>
              +               htmlParseReference(ctxt);<br>
              +           }<br>
              +<br>
              diff --git a/meta/recipes-core/libxml/<a
                moz-do-not-send="true" href="http://libxml2_2.9.2.bb"
                rel="noreferrer" target="_blank">libxml2_2.9.2.bb</a>
              b/meta/recipes-core/libxml/<a moz-do-not-send="true"
                href="http://libxml2_2.9.2.bb" rel="noreferrer"
                target="_blank">libxml2_2.9.2.bb</a><br>
              index 79a395c..4cafc87 100644<br>
              --- a/meta/recipes-core/libxml/<a moz-do-not-send="true"
                href="http://libxml2_2.9.2.bb" rel="noreferrer"
                target="_blank">libxml2_2.9.2.bb</a><br>
              +++ b/meta/recipes-core/libxml/<a moz-do-not-send="true"
                href="http://libxml2_2.9.2.bb" rel="noreferrer"
                target="_blank">libxml2_2.9.2.bb</a><br>
              @@ -2,7 +2,8 @@ require libxml2.inc<br>
              <br>
               SRC_URI += "<a moz-do-not-send="true"
                href="http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar"
                rel="noreferrer" target="_blank">http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar</a>
              \<br>
                         
               <a class="moz-txt-link-freetext" href="file://72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch">file://72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch</a> \<br>
              -         
               <a class="moz-txt-link-freetext" href="file://0001-threads-Define-pthread-definitions-for-glibc-complia.patch">file://0001-threads-Define-pthread-definitions-for-glibc-complia.patch</a>
              \<br>
              +           
              <a class="moz-txt-link-freetext" href="file://0001-threads-Define-pthread-definitions-for-glibc-complia.patch">file://0001-threads-Define-pthread-definitions-for-glibc-complia.patch</a>
              \<br>
              +            <a class="moz-txt-link-freetext" href="file://libxml2-fix-unsafe-memory-access.patch">file://libxml2-fix-unsafe-memory-access.patch</a>
              \<br>
                         "<br>
              <br>
               SRC_URI[libtar.md5sum] =
              "9e6a9aca9d155737868b3dc5fd82f788"<br>
              <span class="HOEnZb"><font color="#888888">--<br>
                  2.6.1<br>
                  <br>
                  --<br>
                  _______________________________________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
                  <a moz-do-not-send="true"
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
                </font></span></blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------090202090000080403090909--
