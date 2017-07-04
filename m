Return-Path: <gordan.markus@pelagicore.com>
Received: from ORO-EDGE-03.luxoft.com (oro-edge-03.luxoft.com [109.166.244.23])
	by mail.openembedded.org (Postfix) with ESMTP id 3024177E7F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 07:36:36 +0000 (UTC)
Received: from ORO-HUBT-03.luxoft.com (172.30.115.38) by
	oro-edge-03.luxoft.com (172.30.19.23) with Microsoft SMTP Server (TLS)
	id 14.3.319.2; Tue, 4 Jul 2017 10:36:34 +0300
Received: from [172.31.241.7] (172.31.241.7) by ORO-HUBT-03.luxoft.com
	(172.30.115.101) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Tue, 4 Jul 2017 10:36:35 +0300
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170703123433.23528-2-gordan.markus@pelagicore.com>
	<CAJTo0LYCWai_UhPcfv7VV3iB+NCRdCvPjsLdbE=iv3f9CSzA0Q@mail.gmail.com>
From: =?UTF-8?Q?Gordan_Marku=c5=a1?= <gordan.markus@pelagicore.com>
Message-ID: <f85be1a4-8f83-fc87-c808-00190070bd3e@pelagicore.com>
Date: Tue, 4 Jul 2017 09:36:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYCWai_UhPcfv7VV3iB+NCRdCvPjsLdbE=iv3f9CSzA0Q@mail.gmail.com>
X-Originating-IP: [172.31.241.7]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cairo: fix QA Issue
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
X-List-Received-Date: Tue, 04 Jul 2017 07:36:44 -0000
Content-Type: multipart/alternative;
	boundary="------------F5C58E43B119B0E318604A47"
Content-Language: en-US

--------------F5C58E43B119B0E318604A47
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017-07-03 15:56, Burton, Ross wrote:
>
> On 3 July 2017 at 13:34, Gordan Markuš <gordan.markus@pelagicore.com 
> <mailto:gordan.markus@pelagicore.com>> wrote:
>
>     -FILES_${PN}-dev += "${libdir}/cairo/*.so"
>     +FILES_${PN}-dev += "${libdir}/cairo ${libdir}/cairo/*.so"
>
>
> I just spent five minutes working out *why* this fixes the QA issue 
> you were getting.
>
> A better fix would be to delete ${libdir}/cairo using:
>
>   rmdir ${libdir}/cairo || :
>
> or
>
>   rmdir --ignore-fail-on-non-empty ${libdir}/cairo
>
> (former is POSIX compliant, but I can't think of a situation where 
> that is only a hypothetical problem)
>
> Then in the commit message you can say that the directory is always 
> created but it only has content if you disable cairo-trace.  At least, 
> I hope you are explicitly disabling cairo-trace as there's no other 
> way I can see for you go get this.
>
> Ross
Thanks for the suggestion Ross, and you are right this only happens if 
there is a bbappend that removes the 'cairo-perf-utils' package. An 
example of this is the meta-ivi layer.
Experimenting a bit it seems to me that even by adding the directory 
removal, in case it is empty, the do_package step still fails. By 
inspecting further I can observe that the directory is in fact not being 
removed but left empty which is quite puzzling.
After doing some thinking I believe it might be better to add the 
removal of the directory and the package files in the bbappend, do you 
agree with this? Here is the PR to meta-ivi that does that 
https://github.com/GENIVI/meta-ivi/pull/45.

--------------F5C58E43B119B0E318604A47
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 2017-07-03 15:56, Burton, Ross wrote:<br>
    <blockquote type="cite"
cite="mid:CAJTo0LYCWai_UhPcfv7VV3iB+NCRdCvPjsLdbE=iv3f9CSzA0Q@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div>
          <div class="gmail_extra">
            <div class="gmail_quote">On 3 July 2017 at 13:34, Gordan
              Markuš <span dir="ltr">&lt;<a
                  href="mailto:gordan.markus@pelagicore.com"
                  target="_blank" moz-do-not-send="true">gordan.markus@pelagicore.com</a>&gt;</span> wrote:<br>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
                <div id="gmail-:yn" class="gmail-a3s gmail-aXjCH
                  gmail-m15d087d2c6436eea">-FILES_${PN}-dev +=
                  "${libdir}/cairo/*.so"<br>
                  +FILES_${PN}-dev += "${libdir}/cairo
                  ${libdir}/cairo/*.so"<br>
                </div>
              </blockquote>
            </div>
            <br>
          </div>
          <div class="gmail_extra">I just spent five minutes working out
            *why* this fixes the QA issue you were getting.</div>
        </div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">A better fix would be to delete
          ${libdir}/cairo using:</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">  rmdir ${libdir}/cairo || :</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">or</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">  rmdir --ignore-fail-on-non-empty
          ${libdir}/cairo</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">(former is POSIX compliant, but I can't
          think of a situation where that is only a hypothetical
          problem)</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Then in the commit message you can say
          that the directory is always created but it only has content
          if you disable cairo-trace.  At least, I hope you are
          explicitly disabling cairo-trace as there's no other way I can
          see for you go get this.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    Thanks for the suggestion Ross, and you are right this only happens
    if there is a bbappend that removes the 'cairo-perf-utils' package.
    An example of this is the meta-ivi layer.<br>
    Experimenting a bit it seems to me that even by adding the directory
    removal, in case it is empty, the do_package step still fails. By
    inspecting further I can observe that the directory is in fact not
    being removed but left empty which is quite puzzling.<br>
    After doing some thinking I believe it might be better to add the
    removal of the directory and the package files in the bbappend, do
    you agree with this? Here is the PR to meta-ivi that does that
    <a class="moz-txt-link-freetext" href="https://github.com/GENIVI/meta-ivi/pull/45">https://github.com/GENIVI/meta-ivi/pull/45</a>.<br>
  </body>
</html>

--------------F5C58E43B119B0E318604A47--
