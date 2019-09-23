Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17DC77DE37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 18:22:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8NIM9tY001323
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Sep 2019 11:22:09 -0700 (PDT)
Received: from [128.224.56.209] (128.224.56.209) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 23 Sep 2019 11:22:08 -0700
To: Tim Orling <ticotimo@gmail.com>
References: <20190923155238.31958-1-Trevor.Gamblin@windriver.com>
	<CANx9H-A2D-sAhKW7YaXnG0E1wg5odcOWubA=BbqwK85XD6nC7A@mail.gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <bbce0fcf-84aa-7b34-b07a-bcd598447f22@windriver.com>
Date: Mon, 23 Sep 2019 14:22:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-A2D-sAhKW7YaXnG0E1wg5odcOWubA=BbqwK85XD6nC7A@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python3-subunit: ensure runtime dependencies are present
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
X-List-Received-Date: Mon, 23 Sep 2019 18:22:09 -0000
Content-Type: multipart/alternative;
	boundary="------------C16C6507D8D0AEAB884E87A1"
Content-Language: en-US

--------------C16C6507D8D0AEAB884E87A1
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 9/23/19 2:06 PM, Tim Orling wrote:

>
>
> On Mon, Sep 23, 2019 at 8:53 AM Trevor Gamblin 
> <Trevor.Gamblin@windriver.com <mailto:Trevor.Gamblin@windriver.com>> 
> wrote:
>
>     From: Trevor Gamblin <trevor.gamblin@windriver.com
>     <mailto:trevor.gamblin@windriver.com>>
>
>     Without access to unittest, subunit cannot be imported in python3:
>
>         root@qemux86-64:~# python3
>         Python 3.7.4 (default, Sep 20 2019, 13:38:31)
>         [GCC 9.2.0] on linux
>         Type "help", "copyright", "credits" or "license" for more
>     information.
>         >>> import subunit
>         Traceback (most recent call last):
>           File "<stdin>", line 1, in <module>
>           File "/usr/lib/python3.7/site-packages/subunit/__init__.py",
>     line 123, in <module>
>             import unittest
>         ModuleNotFoundError: No module named 'unittest'
>         >>>
>
>     Adding python3-testtools to python3-subunit's RDEPENDS fixes the
>     issue. This also implicitly provides the functionality found in
>     the python3-extras module.
>
>
> If we literally only need unittest, then RDEPENDS on -testtools is 
> overkill. We only need the -unittest submodule:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/python3-manifest.json#n1158

After running a quick test with python3-unittest and python3-extras as 
the RDEPENDS:

root@qemux86-64:~# python3
Python 3.7.4 (default, Sep 20 2019, 13:38:31)
[GCC 9.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
 >>> import subunit
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib/python3.7/site-packages/subunit/__init__.py", line 
130, in <module>
     from testtools import content, content_type, 
ExtendedToOriginalDecorator
ModuleNotFoundError: No module named 'testtools'


It does require testtools, but the errors being thrown were for the 
unittest and extras modules (both included with testtools).

>
>
>     Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com
>     <mailto:trevor.gamblin@windriver.com>>
>     ---
>      meta/recipes-devtools/python/python3-subunit_1.3.0.bb
>     <http://python3-subunit_1.3.0.bb> | 2 ++
>      1 file changed, 2 insertions(+)
>
>     diff --git a/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
>     <http://python3-subunit_1.3.0.bb>
>     b/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
>     <http://python3-subunit_1.3.0.bb>
>     index 2ece4451df..55066e2d0f 100644
>     --- a/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
>     <http://python3-subunit_1.3.0.bb>
>     +++ b/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
>     <http://python3-subunit_1.3.0.bb>
>     @@ -1,2 +1,4 @@
>      inherit setuptools3
>      require python-subunit.inc
>     +
>     +RDEPENDS_${PN} = " python3-testtools"
>     -- 
>     2.21.0
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--------------C16C6507D8D0AEAB884E87A1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>On 9/23/19 2:06 PM, Tim Orling wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:CANx9H-A2D-sAhKW7YaXnG0E1wg5odcOWubA=BbqwK85XD6nC7A@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, Sep 23, 2019 at 8:53
            AM Trevor Gamblin &lt;<a
              href="mailto:Trevor.Gamblin@windriver.com"
              moz-do-not-send="true">Trevor.Gamblin@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
            Trevor Gamblin &lt;<a
              href="mailto:trevor.gamblin@windriver.com" target="_blank"
              moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;<br>
            <br>
            Without access to unittest, subunit cannot be imported in
            python3:<br>
            <br>
                root@qemux86-64:~# python3<br>
                Python 3.7.4 (default, Sep 20 2019, 13:38:31)<br>
                [GCC 9.2.0] on linux<br>
                Type "help", "copyright", "credits" or "license" for
            more information.<br>
                &gt;&gt;&gt; import subunit<br>
                Traceback (most recent call last):<br>
                  File "&lt;stdin&gt;", line 1, in &lt;module&gt;<br>
                  File
            "/usr/lib/python3.7/site-packages/subunit/__init__.py", line
            123, in &lt;module&gt;<br>
                    import unittest<br>
                ModuleNotFoundError: No module named 'unittest'<br>
                &gt;&gt;&gt;<br>
            <br>
            Adding python3-testtools to python3-subunit's RDEPENDS fixes
            the<br>
            issue. This also implicitly provides the functionality found
            in<br>
            the python3-extras module.<br>
          </blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">If we literally only need unittest, then
            RDEPENDS on -testtools is overkill. We only need the
            -unittest submodule:</div>
          <div dir="auto">
            <div><a
href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/python3-manifest.json#n1158"
                moz-do-not-send="true">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/python3-manifest.json#n1158</a></div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>After running a quick test with python3-unittest and
      python3-extras as the RDEPENDS:</p>
    <p>root@qemux86-64:~#
python3                                                                            
      <br>
      Python 3.7.4 (default, Sep 20 2019, 13:38:31)             <br>
      [GCC 9.2.0] on
linux                                                                                                                                                                         
      <br>
      Type "help", "copyright", "credits" or "license" for more
      information.           <br>
      &gt;&gt;&gt; import subunit                               <br>
      Traceback (most recent call
      last):                                          <br>
        File "&lt;stdin&gt;", line 1, in
&lt;module&gt;                                                                                                                                                        
      <br>
        File "/usr/lib/python3.7/site-packages/subunit/__init__.py",
      line 130, in &lt;module&gt;      <br>
          from testtools import content, content_type,
ExtendedToOriginalDecorator                                                                                                                 
      <br>
      ModuleNotFoundError: No module named 'testtools'</p>
    <p><br>
    </p>
    <p>It does require testtools, but the errors being thrown were for
      the unittest and extras modules (both included with testtools).<br>
    </p>
    <blockquote type="cite"
cite="mid:CANx9H-A2D-sAhKW7YaXnG0E1wg5odcOWubA=BbqwK85XD6nC7A@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            Signed-off-by: Trevor Gamblin &lt;<a
              href="mailto:trevor.gamblin@windriver.com" target="_blank"
              moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;<br>
            ---<br>
             meta/recipes-devtools/python/<a
              href="http://python3-subunit_1.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-subunit_1.3.0.bb</a>
            | 2 ++<br>
             1 file changed, 2 insertions(+)<br>
            <br>
            diff --git a/meta/recipes-devtools/python/<a
              href="http://python3-subunit_1.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-subunit_1.3.0.bb</a>
            b/meta/recipes-devtools/python/<a
              href="http://python3-subunit_1.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-subunit_1.3.0.bb</a><br>
            index 2ece4451df..55066e2d0f 100644<br>
            --- a/meta/recipes-devtools/python/<a
              href="http://python3-subunit_1.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-subunit_1.3.0.bb</a><br>
            +++ b/meta/recipes-devtools/python/<a
              href="http://python3-subunit_1.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-subunit_1.3.0.bb</a><br>
            @@ -1,2 +1,4 @@<br>
             inherit setuptools3<br>
             require python-subunit.inc<br>
            +<br>
            +RDEPENDS_${PN} = " python3-testtools"<br>
            -- <br>
            2.21.0<br>
            <br>
            -- <br>
            _______________________________________________<br>
            Openembedded-core mailing list<br>
            <a href="mailto:Openembedded-core@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
            <a
              href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------C16C6507D8D0AEAB884E87A1--
