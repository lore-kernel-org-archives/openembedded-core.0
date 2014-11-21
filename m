Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 422D06AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 02:08:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAL28qHm003479
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Nov 2014 18:08:52 -0800 (PST)
Received: from [128.224.163.134] (128.224.163.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 20 Nov 2014 18:08:51 -0800
Message-ID: <546E9E31.4060300@windriver.com>
Date: Fri, 21 Nov 2014 10:06:41 +0800
From: Liu Jian <jian.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1415958217-16545-1-git-send-email-jian.liu@windriver.com>
	<1415958217-16545-2-git-send-email-jian.liu@windriver.com>
	<CAJTo0LaTqjSJ35Lq4hbTDeF0F0Y2iAbdUU4+1VE11mhKoGZrgg@mail.gmail.com>
In-Reply-To: <CAJTo0LaTqjSJ35Lq4hbTDeF0F0Y2iAbdUU4+1VE11mhKoGZrgg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] base-files: files will be over written when updating using rpm
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
X-List-Received-Date: Fri, 21 Nov 2014 02:08:55 -0000
Content-Type: multipart/alternative;
	boundary="------------070204090204040007050803"

--------------070204090204040007050803
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


于 2014年11月21日 04:37, Burton, Ross 写道:
>
> On 14 November 2014 09:43, Jian Liu <jian.liu@windriver.com 
> <mailto:jian.liu@windriver.com>> wrote:
>
>     +CONFFILES_${PN} += "${sysconfdir}/motd
>     ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile"
>
>
> I do have to wonder why we don't allow globs in CONFFILES and set 
> CONFFILES_${PN} to ${sysconfdir} by default...
>
> Ross
>
We wanted to deal with all editable files including config files(maybe 
under /etc), scripts files and so on. Because they may be changed sometime.
But we find that not all files are necessary to handle. For example,
 >>>> base-files        /etc/motd

I'd expect the above to be changed...but not...

 >>>> libpam-runtime:        /etc/pam.d/common-account
 >>>>                     /etc/pam.d/common-auth
 >>>>               /etc/pam.d/common-password
 >>>>               /etc/pam.d/common-session
 >>>> /etc/pam.d/common-session-noninteractive

The key thing for conf files is, is this an action a system 
administrator is likely to do?  for motd yes it is..  for pam 
configurations, not likely.. the operating system developer is the one 
who would make these changes.

This patch just handles files that we think should be protected currently.

-- 
Jian Liu
Email: jian.liu@windriver.com
Office Phone: 86-10-84778539


--------------070204090204040007050803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">于 2014年11月21日 04:37, Burton, Ross 写道:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaTqjSJ35Lq4hbTDeF0F0Y2iAbdUU4+1VE11mhKoGZrgg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 14 November 2014 09:43, Jian Liu <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:jian.liu@windriver.com" target="_blank">jian.liu@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":50s" class="a3s" style="overflow:hidden">+CONFFILES_${PN}
                += "${sysconfdir}/motd ${sysconfdir}/nsswitch.conf
                ${sysconfdir}/profile"</div>
            </blockquote>
            <div><br>
            </div>
            <div>I do have to wonder why we don't allow globs in
              CONFFILES and set CONFFILES_${PN} to ${sysconfdir} by
              default...</div>
            <div><br>
            </div>
            <div>Ross</div>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    We wanted to deal with all editable files including config
    files(maybe under /etc), scripts files and so on. Because they may
    be changed sometime.<br>
    But we find that not all files are necessary to handle. For example,<br>
    &gt;&gt;&gt;&gt; base-files        /etc/motd
    <br>
    <br>
    I'd expect the above to be changed...but not...
    <br>
    <br>
    &gt;&gt;&gt;&gt; libpam-runtime:        /etc/pam.d/common-account
    <br>
    &gt;&gt;&gt;&gt;                     /etc/pam.d/common-auth
    <br>
    &gt;&gt;&gt;&gt;               /etc/pam.d/common-password
    <br>
    &gt;&gt;&gt;&gt;               /etc/pam.d/common-session
    <br>
    &gt;&gt;&gt;&gt;              
    /etc/pam.d/common-session-noninteractive
    <br>
    <br>
    The key thing for conf files is, is this an action a system
    administrator is likely to do?  for motd yes it is..  for pam
    configurations, not likely.. the operating system developer is the
    one who would make these changes.
    <br>
    <br>
    This patch just handles files that we think should be protected
    currently.<br>
    <pre class="moz-signature" cols="72">-- 
Jian Liu
Email: <a class="moz-txt-link-abbreviated" href="mailto:jian.liu@windriver.com">jian.liu@windriver.com</a>
Office Phone: 86-10-84778539</pre>
  </body>
</html>

--------------070204090204040007050803--
